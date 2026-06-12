import 'package:flutter/material.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static void goToAndRemove({required String screenName, Object? arguments}) {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      screenName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  static void goTo({required String screenName, Object? arguments}) {
    navigatorKey.currentState!.pushNamed(screenName, arguments: arguments);
  }

  static void back() {
    navigatorKey.currentState!.pop();
  }

  static void backTo({required String screenName, Object? arguments}) {
    navigatorKey.currentState!.popUntil(
      (route) => route.settings.name == screenName,
    );
  }

  static void mayBack() {
    navigatorKey.currentState!.maybePop();
  }
}
