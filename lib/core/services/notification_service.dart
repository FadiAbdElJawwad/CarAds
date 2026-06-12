import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/core/services/fcm_sender_service.dart';
import 'package:car_ads/features/notifications/model/notification_model.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../app_logger.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  AppLogger.info("Background notification received: ${message.messageId}");
}

class NotificationService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  Future<void> initialize() async {
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      AppLogger.info("Notification permissions granted.");
    }

    await _setupLocalNotifications();

    _setupInteractedMessages();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    _fcm.onTokenRefresh.listen((newToken) async {
      AppLogger.info("FCM Token Refresh detected.");
      final String? uid = await const FlutterSecureStorage().read(key: 'uid');
      if (uid != null) {
        await updateFcmTokenForUser(uid);
      }
    });

    String? token = await _fcm.getToken();
    AppLogger.info("Current Device FCM Token acquired.");

    final String? uid = await const FlutterSecureStorage().read(key: 'uid');
    if (uid != null && token != null) {
      await updateFcmTokenForUser(uid);
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      AppLogger.info("Foreground notification: ${notification?.title}");

      if (notification != null && android != null) {
        _localNotifications.show(
          id: notification.hashCode,
          title: notification.title,
          body: notification.body,
          notificationDetails: NotificationDetails(
            android: AndroidNotificationDetails(
              _channel.id,
              _channel.name,
              channelDescription: _channel.description,
              icon: android.smallIcon ?? '@mipmap/ic_launcher',
              importance: _channel.importance,
              priority: Priority.high,
            ),
            iOS: const DarwinNotificationDetails(
              presentAlert: true,
              presentBadge: true,
              presentSound: true,
            ),
          ),
          payload: jsonEncode(message.data),
        );
      }
    });
  }

  Future<void> _setupInteractedMessages() async {
    RemoteMessage? initialMessage = await _fcm.getInitialMessage();
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    AppLogger.info("Handling notification interaction data: ${message.data}");
    final String? bookingId = message.data['bookingId'];
    if (bookingId != null && bookingId.isNotEmpty) {
      final type = message.data['type'];
      if (type == 'receipt' || type == 'order_status') {
        AppRouter.goTo(
          screenName: ScreenName.confirmRentScreen,
          arguments: {'orderId': bookingId, 'isViewMode': true},
        );
      } else {
        AppRouter.goTo(
          screenName: ScreenName.bookingDetailsScreen,
          arguments: bookingId,
        );
      }
    }
  }

  Future<void> _setupLocalNotifications() async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(_channel);

    await _localNotifications.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (response) {
        AppLogger.info("Notification interaction: ${response.payload}");
        if (response.payload != null) {
          final Map<String, dynamic> data = jsonDecode(response.payload!);
          final String? bookingId = data['bookingId'];
          if (bookingId != null && bookingId.isNotEmpty) {
            final type = data['type'];
            if (type == 'receipt' || type == 'order_status') {
              AppRouter.goTo(
                screenName: ScreenName.confirmRentScreen,
                arguments: {'orderId': bookingId, 'isViewMode': true},
              );
            } else {
              AppRouter.goTo(
                screenName: ScreenName.bookingDetailsScreen,
                arguments: bookingId,
              );
            }
          }
        }
      },
    );
  }

  /// Synchronizes the device FCM token with the user's Firestore document.
  Future<void> updateFcmTokenForUser(String userId) async {
    try {
      String? token = await _fcm.getToken();
      if (token != null) {
        await _db.collection('users').doc(userId).update({'fcmToken': token});
        AppLogger.info("User FCM Token synchronized in Firestore.");
      }
    } catch (e) {
      AppLogger.error("Failed to sync FCM Token for user $userId", e);
    }
  }

  Future<void> sendNotification({
    required String userId,
    required String title,
    required String body,
    Map<String, dynamic>? extraData,
  }) async {
    try {
      // 1. In-app Persistence
      await _db.collection('notifications').add({
        'userId': userId,
        'title': title,
        'body': body,
        'time': FieldValue.serverTimestamp(),
        'isRead': false,
        'data': extraData ?? {},
      });

      final userDoc = await _db.collection('users').doc(userId).get();

      if (userDoc.exists) {
        final data = userDoc.data();
        final String? fcmToken = data?['fcmToken'];

        if (fcmToken != null && fcmToken.isNotEmpty) {
          await FcmSenderService.sendNotificationToUser(
            targetFcmToken: fcmToken,
            title: title,
            body: body,
            extraData: extraData,
          );
        } else {
          AppLogger.warning(
            "Push relay skipped: User $userId lacks a registered token.",
          );
        }
      }
    } catch (e) {
      AppLogger.error(
        "Dual-notification orchestration failure for user $userId",
        e,
      );
    }
  }

  Stream<List<NotificationModel>> getNotificationsStream(String userId) {
    return _db
        .collection('notifications')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
          final notifications = snapshot.docs
              .map((doc) => NotificationModel.fromFirestore(doc))
              .toList();
          notifications.sort((a, b) => b.time.compareTo(a.time));
          return notifications;
        });
  }

  Future<void> markAsRead(String notificationId) async {
    await _db.collection('notifications').doc(notificationId).update({
      'isRead': true,
    });
  }

  Future<void> deleteNotification(String notificationId) async {
    await _db.collection('notifications').doc(notificationId).delete();
  }

  Future<void> clearAllNotifications(String userId) async {
    final snapshot = await _db
        .collection('notifications')
        .where('userId', isEqualTo: userId)
        .get();

    final batch = _db.batch();
    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
  }
}
