import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../core/extension/shared_preferences.dart';
import '../../../../generated/l10n.dart';
import '../../../../routes/app_router.dart';
import '../../../../routes/screen_name.dart';
import '../helper/auth_service.dart';
import '../helper/show_snack_bar.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    try {
      await _authService.registerUser(
        email: email,
        password: password,
      );
      AppRouter.goToAndRemove(screenName: ScreenName.navButtonBar);

      await storage.write(key: 'name', value: name);
      logindata.setBool('login', true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, S
            .of(context)
            .weakPassword);
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, S
            .of(context)
            .usedEmail);
      } else {
        showSnackBar(context, e.message ?? 'An error occurred');
      }
    } finally {
      _setLoading(false);
    }
  }

  Future<void> loginUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    _setLoading(true);
    try {
      await _authService.loginUser(
        email: email,
        password: password,
      );
      AppRouter.goToAndRemove(screenName: ScreenName.navButtonBar);

      final name = email
          .split('@')
          .first;
      await storage.write(key: 'name', value: name);

      logindata.setBool('login', true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        showSnackBar(context, S
            .of(context)
            .invalidCredential);
      } else {
        showSnackBar(context, S
            .of(context)
            .authenticationError);
      }
    } finally {
      _setLoading(false);
    }
  }
}
