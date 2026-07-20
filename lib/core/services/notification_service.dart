import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/core/services/fcm_sender_service.dart';
import 'package:car_ads/features/notifications/model/notification_model.dart';
import 'package:car_ads/features/showroom/model/rent_request_model.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart'; // Added for BuildContext
import '../app_logger.dart';
import '../extension/app_sizes.dart'; // Import where context.loc is defined

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  AppLogger.info("Background notification received: ${message.messageId}");
}

class NotificationService {
  NotificationService._internal();
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
  FlutterLocalNotificationsPlugin();

  // Removed static const _channel to allow for localization

  Future<void> initialize(BuildContext context) async {
    final AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      context.loc.notificationChannelName,
      description: context.loc.notificationChannelDescription,
      importance: Importance.max,
    );

    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      AppLogger.info("Notification permissions granted.");
    }

    await _setupLocalNotifications(channel);

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
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: android.smallIcon ?? '@mipmap/ic_launcher',
              importance: channel.importance,
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
      await _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      await _handleMessage(message);
    });
  }

  Future<void> _handleMessage(RemoteMessage message) async {
    AppLogger.info("Handling notification interaction data: ${message.data}");
    final String? bookingId = message.data['bookingId'];
    final String? type = message.data['type'];

    if (bookingId != null && bookingId.isNotEmpty) {
      if (type == 'new_request') {
        // Showroom Role: Fetch request model and navigate to details
        final requestSnapshot = await _db
            .collection('rent_requests')
            .where('requestId', isEqualTo: bookingId)
            .limit(1)
            .get();

        if (requestSnapshot.docs.isNotEmpty) {
          final request = RentRequestModel.fromFirestore(
            requestSnapshot.docs.first,
          );
          AppRouter.goTo(
            screenName: ScreenName.requestDetailsScreen,
            arguments: request,
          );
        } else {
          AppLogger.warning("Request not found for ID: $bookingId");
          // Fallback to requests list if model not found
          AppRouter.goTo(
            screenName: ScreenName.requestsScreen,
            arguments: true,
          );
        }
      } else {
        // Customer Role (receipt, order_status, or default)
        AppRouter.goTo(
          screenName: ScreenName.confirmRentScreen,
          arguments: {'orderId': bookingId, 'isViewMode': true},
        );
      }
    }
  }

  Future<void> _setupLocalNotifications(AndroidNotificationChannel channel) async {
    const initializationSettings = InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
    >()
        ?.createNotificationChannel(channel);

    await _localNotifications.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (response) async {
        AppLogger.info("Notification interaction: ${response.payload}");
        if (response.payload != null) {
          final Map<String, dynamic> data = jsonDecode(response.payload!);
          final String? bookingId = data['bookingId'];
          final String? type = data['type'];

          if (bookingId != null && bookingId.isNotEmpty) {
            if (type == 'new_request') {
              final requestSnapshot = await _db
                  .collection('rent_requests')
                  .where('requestId', isEqualTo: bookingId)
                  .limit(1)
                  .get();

              if (requestSnapshot.docs.isNotEmpty) {
                final request = RentRequestModel.fromFirestore(
                  requestSnapshot.docs.first,
                );
                AppRouter.goTo(
                  screenName: ScreenName.requestDetailsScreen,
                  arguments: request,
                );
              } else {
                AppRouter.goTo(
                  screenName: ScreenName.requestsScreen,
                  arguments: true,
                );
              }
            } else {
              AppRouter.goTo(
                screenName: ScreenName.confirmRentScreen,
                arguments: {'orderId': bookingId, 'isViewMode': true},
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
          await FcmSenderService().sendNotificationToUser(
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

  Future<void> markAllAsRead(String userId) async {
    try {
      final snapshot = await _db
          .collection('notifications')
          .where('userId', isEqualTo: userId)
          .where('isRead', isEqualTo: false)
          .get();

      if (snapshot.docs.isEmpty) return;

      final batch = _db.batch();
      for (final doc in snapshot.docs) {
        batch.update(doc.reference, {'isRead': true});
      }
      await batch.commit();
      AppLogger.info("All notifications marked as read for user $userId");
    } catch (e) {
      AppLogger.error("Failed to mark all notifications as read for user $userId", e);
    }
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