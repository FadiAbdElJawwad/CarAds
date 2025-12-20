import 'package:car_ads/routes/screen_name.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import '../view/pages/auth/login_screen.dart';
import '../view/pages/auth/onbording_screen.dart';
import '../view/pages/auth/splash_screen.dart';


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