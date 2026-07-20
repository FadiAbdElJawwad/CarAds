import 'package:car_ads/common/show_snack_bar.dart';
import 'package:car_ads/core/extension/app_sizes.dart';
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
    final loc = context.loc;
    if (!newEmailFormKey.currentState!.validate()) return;

    _setLoading(true);
    try {
      await _authService.updateEmail(
        context: context,
        currentPassword: passwordController.text,
        newEmail: newEmailController.text.trim(),
      );

      if (!context.mounted) return;
      showSnackBar(
        context,
        loc.emailVerificationSent,
      );

      final newEmail = newEmailController.text.trim();
      final authProvider = context.read<AuthProvider>();
      await authProvider.updateEmailInFirestore(newEmail);

      final userId = authProvider.state.user?.uid;
      if (userId != null) {
        await _notificationService.sendNotification(
          userId: userId,
          title: loc.emailChangeRequestedTitle,
          body: loc.emailChangeRequestedBody(newEmail),
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
        String errorMessage = _handleAuthError(context, e);
        showSnackBar(context, errorMessage);
      }
    } finally {
      _setLoading(false);
    }
  }

  String _handleAuthError(BuildContext context, dynamic e) {
    final loc = context.loc;
    if (e is String) return e;

    final message = e.toString().toLowerCase();
    if (message.contains('email-already-in-use')) {
      return loc.emailAlreadyInUse;
    } else if (message.contains('invalid-email')) {
      return loc.invalidEmailFormat;
    } else if (message.contains('wrong-password')) {
      return loc.incorrectCurrentPassword;
    } else if (message.contains('user-not-found')) {
      return loc.sessionExpired;
    } else if (message.contains('requires-recent-login')) {
      return loc.recentLoginRequired;
    }
    return loc.updateEmailError;
  }

  @override
  void dispose() {
    currentEmailController.dispose();
    passwordController.dispose();
    newEmailController.dispose();
    super.dispose();
  }
}