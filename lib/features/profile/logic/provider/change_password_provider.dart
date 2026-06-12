import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/auth/logic/helper/auth_service.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/core/services/notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../common/show_snack_bar.dart';

class ChangePasswordProvider extends ChangeNotifier {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final NotificationService _notificationService = NotificationService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _currentPasswordError;
  String? get currentPasswordError => _currentPasswordError;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setCurrentPasswordError(String? error) {
    _currentPasswordError = error;
    notifyListeners();
  }

  Future<void> handleChangePassword(BuildContext context) async {
    _setCurrentPasswordError(null);
    if (!formKey.currentState!.validate()) return;

    _setLoading(true);
    try {
      await AuthService().updatePassword(
        currentPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      );

      // Send notification
      if (context.mounted) {
        final authProvider = context.read<AuthProvider>();
        final userId = authProvider.state.user?.uid;
        if (userId != null) {
          await _notificationService.sendNotification(
            userId: userId,
            title: 'Password Changed',
            body: 'Your account password has been changed successfully.',
          );
        }
        AppRouter.goTo(screenName: ScreenName.confirmChangeScreen);
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
          _setCurrentPasswordError('Incorrect current password');
          formKey.currentState!.validate();
        } else if (e.code == 'too-many-requests') {
          showSnackBar(
            context,
            'Too many attempts. Please try again later or reset your password.',
          );
        } else {
          showSnackBar(context, e.message ?? 'An error occurred');
        }
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    } finally {
      _setLoading(false);
    }
  }

  void disposeControllers() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
  }
}
