import 'package:car_ads/core/routes/screen_name.dart';
import 'package:flutter/material.dart';
import '../../features/ nav_button_bar/view/screens/nav_button_bar.dart';
import '../../features/auth/view/screens/login_screen.dart';
import '../../features/auth/view/screens/onbording_screen.dart';
import '../../features/auth/view/screens/reset_password.dart';
import '../../features/auth/view/screens/sign_up_screen.dart';
import '../../features/auth/view/screens/splash_screen.dart';
import '../../features/home/model/car_card_model.dart';
import '../../features/home/view/screens/car_details_form.dart';
import '../../features/home/view/screens/car_ads_screen.dart';
import '../../features/home/view/screens/home_screen.dart';
import '../../features/home/view/screens/showroom_details_form.dart';



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
        case ScreenName.resetPassword:
        result = const ResetPassword();
        break;
        case ScreenName.home:
        result = const HomeScreen();
        break;
        case ScreenName.navButtonBar:
        result = const NavButtonBar();
        break;
        case ScreenName.carDetailsForm:
        result =  CarDetailsForm(car: settings.arguments as CarCardModel,);
        break;
        case ScreenName.showroomDetailsForm:
        result =  ShowroomDetailsForm();
        break;
        case ScreenName.carAdsScreen:
        result =  CarAdsScreen();
        break;

      default:
        result = const Scaffold(
          body: Center(
            child: Text('Wrong path'),
          ),
        );
    }
    return MaterialPageRoute(builder: (context) => result,settings: RouteSettings(name: settings.name));
  }
}