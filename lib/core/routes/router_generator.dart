import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/home/model/showroom_model.dart';
import 'package:flutter/material.dart';
import '../../features/auth/view/screens/login_screen.dart';
import '../../features/auth/view/screens/onbording_screen.dart';
import '../../features/auth/view/screens/reset_password.dart';
import '../../features/auth/view/screens/sign_up_screen.dart';
import '../../features/auth/view/screens/splash_screen.dart';
import '../../features/home/model/car_card_model.dart';
import '../../features/home/view/screens/car_details_form.dart';
import '../../features/home/view/screens/car_ads_screen.dart';
import '../../features/home/view/screens/checkout.dart';
import '../../features/home/view/screens/confirm_rent_screen.dart';
import '../../features/home/view/screens/home_screen.dart';
import '../../features/home/view/screens/map_screen.dart';
import '../../features/home/view/screens/rental_completed_screen.dart';
import '../../features/home/view/screens/showroom_details_form.dart';
import '../../features/nav_button_bar/view/screens/nav_button_bar.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget result;
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
        result = CarDetailsForm(car: settings.arguments as CarCardModel,);
        break;
      case ScreenName.showroomDetailsForm:
        result = ShowroomDetailsForm(showroom: settings.arguments as ShowroomModel);
        break;
      case ScreenName.carAdsScreen:
        result = const CarAdsScreen();
        break;
        case ScreenName.checkout:
        result = Checkout(car: settings.arguments as CarCardModel);
        break;
        case ScreenName.mapScreen:
        result = MapScreen(orderId: settings.arguments as String);
        break;
        case ScreenName.confirmRentScreen:
        result = ConfirmRentScreen( orderId: settings.arguments as String);
        break;
        case ScreenName.rentalCompletedScreen:
        result = RentalCompletedScreen();
        break;

      default:
        result = const Scaffold(
          body: Center(
            child: Text('Wrong path'),
          ),
        );
    }
    return MaterialPageRoute(builder: (context) => result,
        settings: RouteSettings(name: settings.name));
  }
}
