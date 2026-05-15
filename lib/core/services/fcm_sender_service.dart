import 'dart:convert';
import 'package:http/http.dart' as http;
import '../app_logger.dart';

/// Service responsible for sending push notifications via an external Google Apps Script bridge.
class FcmSenderService {
  /// The Google Apps Script web app URL configured to relay FCM messages.
  static const String _gasUrl = "https://script.google.com/macros/s/AKfycbxLoVibqfBooQY4b64HXJ7HJcKzSlAlJSzwoDMN34YlEgodg6N8NeQNzKFe-amvt2nO9Q/exec";

  /// Sends a push notification to a specific device using its FCM Token.
  ///
  /// [targetFcmToken] is the unique identifier for the target device.
  /// [title] and [body] represent the notification content.
  /// [extraData] can optionally be used to pass custom key-value pairs to the app.
  static Future<void> sendNotificationToUser({
    required String targetFcmToken,
    required String title,
    required String body,
    Map<String, dynamic>? extraData,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(_gasUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "token": targetFcmToken,
          "title": title,
          "body": body,
          "data": extraData ?? {},
        }),
      );

      // Handle successful relay or redirects (common with Google Apps Script).
      if (response.statusCode == 200 || response.statusCode == 302) {
        AppLogger.info("External push notification relayed successfully: ${response.body}");
      } else {
        AppLogger.error("Failed to relay push notification. Status: ${response.statusCode}");
      }
    } catch (e) {
      AppLogger.error("Error occurred while sending notification via bridge service: $e");
    }
  }
}
