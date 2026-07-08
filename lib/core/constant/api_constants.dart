import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  ApiConstants._();

  static String get driveUploadUrl =>
      dotenv.env['DRIVE_UPLOAD_URL'] ?? '';

  static String get fcmNotificationUrl =>
      dotenv.env['FCM_NOTIFICATION_URL'] ?? '';

  static String get stripePaymentUrl =>
      dotenv.env['STRIPE_PAYMENT_URL'] ?? '';
}
