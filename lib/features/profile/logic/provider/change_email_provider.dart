import 'package:car_ads/common/show_snack_bar.dart';
import 'package:car_ads/core/routes/app_router.dart';
import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/auth/logic/helper/auth_service.dart';
import 'package:car_ads/features/auth/logic/provider/auth_provider.dart';
import 'package:car_ads/core/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeEmailProvider extends ChangeNotifier {
  final GlobalKey<FormState> currentEmailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> newEmailFormKey = GlobalKey<FormState>();

  final TextEditingController currentEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newEmailController = TextEditingController();

  final AuthService _authService = AuthService();
  final NotificationService _notificationService = NotificationService();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void proceedToNewEmail(BuildContext context) {
    if (!currentEmailFormKey.currentState!.validate()) return;
    AppRouter.goTo(screenName: ScreenName.newEmailScreen);
  }

  Future<void> updateEmail(BuildContext context) async {
    if (!newEmailFormKey.currentState!.validate()) return;

    _setLoading(true);
    try {
      await _authService.updateEmail(
        currentPassword: passwordController.text,
        newEmail: newEmailController.text.trim(),
      );

      if (!context.mounted) return;
      showSnackBar(
        context,
        'A verification link has been sent to your new email. Please verify it and log in again.',
      );

      final newEmail = newEmailController.text.trim();
      final authProvider = context.read<AuthProvider>();
      await authProvider.updateEmailInFirestore(newEmail);

      final userId = authProvider.state.user?.uid;
      if (userId != null) {
        await _notificationService.sendNotification(
          userId: userId,
          title: 'Email Change Requested',
          body:
              'A request to change your email to $newEmail has been initiated.',
        );
      }

      if (!context.mounted) return;
      currentEmailController.clear();
      newEmailController.clear();
      passwordController.clear();

      await context.read<AuthProvider>().logout();

      AppRouter.goToAndRemove(screenName: ScreenName.login);
    } catch (e) {
      if (context.mounted) {
        String errorMessage = _handleAuthError(e);
        showSnackBar(context, errorMessage);
      }
    } finally {
      _setLoading(false);
    }
  }

  String _handleAuthError(dynamic e) {
    if (e is String) return e;

    final message = e.toString().toLowerCase();
    if (message.contains('email-already-in-use')) {
      return 'This email is already in use by another account.';
    } else if (message.contains('invalid-email')) {
      return 'The email address is badly formatted.';
    } else if (message.contains('wrong-password')) {
      return 'The current password you entered is incorrect.';
    } else if (message.contains('user-not-found')) {
      return 'User session not found. Please log in again.';
    } else if (message.contains('requires-recent-login')) {
      return 'For security reasons, please log in again before changing your email.';
    }
    return 'An error occurred while updating your email. Please try again.';
  }

  @override
  void dispose() {
    currentEmailController.dispose();
    passwordController.dispose();
    newEmailController.dispose();
    super.dispose();
  }
}
