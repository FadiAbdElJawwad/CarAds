import 'dart:convert';
import 'package:car_ads/core/constant/api_constants.dart';
import 'package:http/http.dart' as http;
import '../app_logger.dart';

class FcmSenderService {
  FcmSenderService._();

  static Future<void> sendNotificationToUser({
    required String targetFcmToken,
    required String title,
    required String body,
    Map<String, dynamic>? extraData,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.fcmNotificationUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "token": targetFcmToken,
          "title": title,
          "body": body,
          "data": extraData ?? {},
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 302) {
        AppLogger.info("FCM relay successful.");
      } else {
        AppLogger.error("FCM bridge rejection. Status: ${response.statusCode}");
      }
    } catch (e) {
      AppLogger.error("Push relay communication failure", e);
    }
  }
}
