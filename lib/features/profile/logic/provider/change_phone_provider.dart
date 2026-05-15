import 'package:car_ads/common/show_snack_bar.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/auth/logic/helper/auth_service.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/core/services/notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangePhoneProvider extends ChangeNotifier {
  final GlobalKey<FormState> phoneFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  String _otpCode = '';

  final AuthService _authService = AuthService();
  final NotificationService _notificationService = NotificationService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _verificationId;

  void setOtpCode(String code) {
    _otpCode = code;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> sendOtp(BuildContext context) async {
    if (!phoneFormKey.currentState!.validate()) return;

    _setLoading(true);
    try {
      await _authService.verifyPhoneNumber(
        phoneNumber: phoneController.text.trim(),
        codeSent: (verificationId, resendToken) {
          _verificationId = verificationId;
          _setLoading(false);
          AppRouter.goTo(screenName: ScreenName.verifyPhoneOtpScreen);
        },
        verificationFailed: (e) {
          _setLoading(false);
          if (context.mounted) {
            showSnackBar(context, e.message ?? 'Verification failed');
          }
        },
      );
    } catch (e) {
      _setLoading(false);
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }

  Future<void> verifyOtp(BuildContext context) async {
    if (_otpCode.length != 6) {
      showSnackBar(context, 'Please enter the 6-digit OTP code');
      return;
    }
    if (_verificationId == null) return;

    _setLoading(true);
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: _otpCode,
      );

      await _authService.updatePhoneNumber(credential);

      // Update Firestore
      final newPhone = phoneController.text.trim();
      if (context.mounted) {
        final authProvider = context.read<AuthProvider>();
        await authProvider.updateUserData(phone: newPhone);

        // Send notification
        final userId = authProvider.state.user?.uid;
        if (userId != null) {
          await _notificationService.sendNotification(
            userId: userId,
            title: 'Phone Number Updated',
            body: 'Your phone number has been updated to $newPhone successfully.',
          );
        }
      }

      _setLoading(false);
      if (context.mounted) {
        showSnackBar(context, 'Phone number updated successfully!');
        AppRouter.backTo(screenName: ScreenName.navButtonBar);
      }
    } catch (e) {
      _setLoading(false);
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }
}
