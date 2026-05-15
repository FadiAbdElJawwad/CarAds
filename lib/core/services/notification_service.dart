import 'package:car_ads/core/services/fcm_sender_service.dart';
import 'package:car_ads/core/models/notification_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../app_logger.dart';

/// Top-level background message handler for Firebase Cloud Messaging.
/// This must be a top-level function and annotated with @pragma('vm:entry-point').
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  AppLogger.info("Background notification received: ${message.messageId}");
}

/// Service class responsible for managing app notifications (FCM & Firestore).
class NotificationService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  /// Defines the notification channel for Android high importance notifications.
  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel is used for important notifications.',
    importance: Importance.max,
  );

  /// Initializes the notification service, requests permissions, and sets up listeners.
  Future<void> initialize() async {
    // Request notification permissions for Android 13+ and iOS.
    NotificationSettings settings = await _fcm.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      AppLogger.info("Notification permissions granted.");
    }

    // Setup local notifications for foreground head-up alerts.
    await _setupLocalNotifications();

    // Register the background message handler.
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Retrieve and log the FCM Token for the current device.
    String? token = await _fcm.getToken();
    AppLogger.info("FCM Token: $token");

    // Automatically update the FCM token in Firestore if the user is logged in.
    if (token != null) {
      await _updateTokenInFirestore(token);
    }

    // Handle incoming notifications while the app is in the foreground.
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      AppLogger.info("Foreground notification received: ${notification?.title}");

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
        );
      }
    });
  }

  /// Configures local notification settings and creates the Android notification channel.
  Future<void> _setupLocalNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    await _localNotifications.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        AppLogger.info("Notification tapped: ${response.payload}");
      },
    );
  }

  /// Updates the user's FCM token in their Firestore document.
  Future<void> _updateTokenInFirestore(String token) async {
    try {
      final String? uid = await const FlutterSecureStorage().read(key: 'uid');
      if (uid != null) {
        await _db.collection('users').doc(uid).update({
          'fcmToken': token,
        });
        AppLogger.info("FCM Token updated in Firestore for user: $uid");
      }
    } catch (e) {
      AppLogger.error("Failed to update FCM Token in Firestore", e);
    }
  }

  // --- Firestore Notification Operations ---

  /// Returns a stream of notifications for a specific user, sorted by time.
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

  /// Marks a specific notification as read in Firestore.
  Future<void> markAsRead(String notificationId) async {
    await _db.collection('notifications').doc(notificationId).update({
      'isRead': true,
    });
  }

  /// Deletes a specific notification from Firestore.
  Future<void> deleteNotification(String notificationId) async {
    await _db.collection('notifications').doc(notificationId).delete();
  }

  /// Clears all notifications for a specific user using a batch operation.
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


  /// The DUAL ACTION: Saves to Firestore AND triggers FCM Push via GAS bridge.
  Future<void> sendNotification({
    required String userId,
    required String title,
    required String body,
  }) async {
    try {
      // 1. Save to Firestore for in-app display.
      await _db.collection('notifications').add({
        'userId': userId,
        'title': title,
        'body': body,
        'time': FieldValue.serverTimestamp(),
        'isRead': false,
      });

      // 2. Fetch the target user's FCM Token from Firestore.
      final userDoc = await _db.collection('users').doc(userId).get();

      if (userDoc.exists) {
        final data = userDoc.data();
        final String? fcmToken = data?['fcmToken'];

        if (fcmToken != null && fcmToken.isNotEmpty) {
          // 3. Trigger external push notification via FcmSenderService.
          await FcmSenderService.sendNotificationToUser(
            targetFcmToken: fcmToken,
            title: title,
            body: body,
          );
        } else {
          AppLogger.warning("Push notification skipped: User $userId has no fcmToken.");
        }
      }
    } catch (e) {
      AppLogger.error("Failed to process dual-notification (Firestore & FCM) for user $userId", e);
    }
  }
}
