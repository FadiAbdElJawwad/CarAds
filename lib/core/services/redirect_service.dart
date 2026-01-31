import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../routes/screen_name.dart';

class RedirectService {
  RedirectService._();
  static final RedirectService instance = RedirectService._();

  final _storage = const FlutterSecureStorage();

  Future<bool> _isOnboardingCompleted() async {
    final onboarding = await _storage.read(key: 'onboarding');
    return onboarding != null;
  }

  Future<bool> _isLoggedIn() async {
    final login = await _storage.read(key: 'login');
    return login != null;
  }

  Future<String> getInitialScreen() async {
    final isOnboardingCompleted = await _isOnboardingCompleted();
    if (!isOnboardingCompleted) {
      return ScreenName.onbording;
    }

    final isLoggedIn = await _isLoggedIn();
    if (!isLoggedIn) {
      return ScreenName.login;
    }

    return ScreenName.navButtonBar;
  }
}
