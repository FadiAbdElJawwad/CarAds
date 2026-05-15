import 'package:car_ads/core/services/notification_service.dart';
import 'package:car_ads/core/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends ChangeNotifier {
  final NotificationService _notificationService = NotificationService();

  Stream<List<NotificationModel>> getNotificationsStream(String userId) =>
      _notificationService.getNotificationsStream(userId);

  Stream<bool> hasUnreadNotificationsStream(String userId) {
    return getNotificationsStream(userId).map(
      (notifications) => notifications.any((notification) => !notification.isRead),
    );
  }

  Future<void> markAsRead(String notificationId) async {
    try {
      await _notificationService.markAsRead(notificationId);
    } catch (e) {
      debugPrint('Error marking notification as read: $e');
    }
  }

  Future<void> deleteNotification(String notificationId) async {
    try {
      await _notificationService.deleteNotification(notificationId);
    } catch (e) {
      debugPrint('Error deleting notification: $e');
    }
  }

  Future<void> clearAllNotifications(String userId) async {
    try {
      await _notificationService.clearAllNotifications(userId);
    } catch (e) {
      debugPrint('Error clearing notifications: $e');
    }
  }
}
