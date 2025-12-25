import 'package:car_ads/routes/screen_name.dart';
import 'package:flutter/material.dart';
import '../features/auth/view/home_screen.dart';
import '../features/auth/view/login_screen.dart';
import '../features/auth/view/onbording_screen.dart';
import '../features/auth/view/sign_up_screen.dart';
import '../features/auth/view/splash_screen.dart';


class RoutGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    StatefulWidget result;
    switch (settings.name) {
      case ScreenName.splash:
        result = const SplashScreen();
        break;
        case ScreenName.onbording:
        result = const OnbordingScreen();
        break;
        case ScreenName.login:
        result = const LoginScreen();
        break;
        case ScreenName.signUpScreen:
        result = const SignUpScreen();
        break;
        case ScreenName.home:
        result = const HomeScreen();
        break;

      default:
        result = const Scaffold(
          body: Center(
            child: Text('Wrong path'),
          ),
        );
    }
    return MaterialPageRoute(builder: (context) => result);
  }
}