import 'dart:async';
import 'package:car_ads/common/show_snack_bar.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
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

  Future<dynamic> sendOtp(
    BuildContext context, {
    bool isRegistration = false,
  }) async {
    final loc = context.loc;
    if (!isRegistration && !phoneFormKey.currentState!.validate()) return;

    _setLoading(true);
    final completer = Completer<dynamic>();

    try {
      await _authService.verifyPhoneNumber(
        phoneNumber: phoneController.text.trim(),
        codeSent: (verificationId, resendToken) async {
          _verificationId = verificationId;
          _setLoading(false);
          final result = await AppRouter.goTo(
            screenName: ScreenName.verifyPhoneOtpScreen,
            arguments: isRegistration,
          );
          completer.complete(result);
        },
        verificationFailed: (e) {
          _setLoading(false);
          if (context.mounted) {
            showSnackBar(context, e.message ?? loc.verificationFailed);
          }
          completer.complete(null);
        },
      );
      return completer.future;
    } catch (e) {
      _setLoading(false);
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
      return null;
    }
  }

  Future<void> verifyOtp(
    BuildContext context, {
    bool isRegistration = false,
  }) async {
    final loc = context.loc;
    if (_otpCode.length != 6) {
      if (context.mounted) {
        showSnackBar(context, loc.enterOtpError);
      }
      return;
    }
    if (_verificationId == null) return;

    _setLoading(true);
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: _otpCode,
      );

      if (isRegistration) {
        final userCredential = await FirebaseAuth.instance.signInWithCredential(
          credential,
        );

        await userCredential.user?.delete();
        await _authService.signOut();

        _setLoading(false);
        if (context.mounted) {
          Navigator.pop(context, true);
        }
        return;
      }

      await _authService.updatePhoneNumber(credential);
      final newPhone = phoneController.text.trim();
      if (context.mounted) {
        final authProvider = context.read<AuthProvider>();
        await authProvider.updateUserData(phone: newPhone);

        final userId = authProvider.state.user?.uid;
        if (userId != null) {
          await _notificationService.sendNotification(
            userId: userId,
            title: loc.phoneUpdatedTitle,
            body: loc.phoneUpdatedBody(newPhone),
          );
        }
      }

      _setLoading(false);
      if (context.mounted) {
        showSnackBar(context, loc.phoneUpdatedSuccess);
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