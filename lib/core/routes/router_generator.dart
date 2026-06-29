import 'package:car_ads/core/routes/screen_name.dart';
import 'package:car_ads/features/home/model/showroom_model.dart';
import 'package:car_ads/features/profile/view/screens/update_profile_screen.dart';
import 'package:car_ads/features/profile/view/screens/change_phone_screen.dart';
import 'package:car_ads/features/profile/view/screens/verify_phone_otp_screen.dart';
import 'package:flutter/material.dart';
import '../../features/add_ads/view/screens/add_ads_screen.dart';
import '../../features/auth/view/screens/login_screen.dart';
import '../../features/auth/view/screens/onbording_screen.dart';
import '../../features/auth/view/screens/reset_password.dart';
import '../../features/auth/view/screens/sign_up_screen.dart';
import '../../features/auth/view/screens/splash_screen.dart';
import '../../features/history/view/screens/history_screen.dart';
import '../../features/explore/model/car_card_model.dart';
import '../../features/home/view/screens/car_details_form.dart';
import '../../features/explore/view/screens/car_ads_screen.dart';
import '../../features/rental/view/screens/checkout_screen.dart';
import '../../features/rental/view/screens/confirm_rent_screen.dart';
import '../../features/home/view/screens/home_screen.dart';
import '../../features/home/view/screens/map_screen.dart';
import '../../features/notifications/view/screens/notification_screen.dart';
import '../../features/rental/view/screens/rental_completed_screen.dart';
import '../../features/home/view/screens/showroom_details_form.dart';
import '../../features/nav_button_bar/view/screens/nav_button_bar.dart';
import '../../features/profile/view/screens/change_email_screen.dart';
import '../../features/profile/view/screens/change_language_screen.dart';
import '../../features/profile/view/screens/change_password_screen.dart';
import '../../features/profile/view/screens/confirm_change_screen.dart';
import '../../features/profile/view/screens/faq_screen.dart';
import '../../features/profile/view/screens/new_email_screen.dart';
import '../../features/profile/view/screens/privacy_policy_screen.dart';
import '../../features/profile/view/screens/terms_conditions_screen.dart';
import '../../features/showroom/model/rent_request_model.dart';
import '../../features/showroom/view/screens/license_upload_screen.dart';
import '../../features/showroom/view/screens/request_screen.dart';
import '../../features/showroom/view/screens/verification_screen.dart';

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
        result = LoginScreen(role: settings.arguments as String?);
        break;
      case ScreenName.signUpScreen:
        result = SignUpScreen(role: settings.arguments as String?);
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
        result = CarDetailsForm(car: settings.arguments as CarCardModel);
        break;
      case ScreenName.showroomDetailsForm:
        result = ShowroomDetailsForm(
          showroom: settings.arguments as ShowroomModel,
        );
        break;
      case ScreenName.carAdsScreen:
        result = const CarAdsScreen();
        break;
      case ScreenName.checkout:
        result = Checkout(car: settings.arguments as CarCardModel);
        break;
      case ScreenName.mapScreen:
        String? orderId;
        if (settings.arguments is String) {
          orderId = settings.arguments as String;
        }
        result = MapScreen(orderId: orderId);
        break;
      case ScreenName.confirmRentScreen:
        if (settings.arguments is Map<String, dynamic>) {
          final args = settings.arguments as Map<String, dynamic>;
          result = ConfirmRentScreen(
            orderId: args['orderId'] as String,
            isViewMode: args['isViewMode'] as bool? ?? false,
          );
        } else {
          result = ConfirmRentScreen(orderId: settings.arguments as String);
        }
        break;
      case ScreenName.rentalCompletedScreen:
        result = RentalCompletedScreen();
        break;
      case ScreenName.addAdsScreen:
        result = AddAdsScreen();
        break;
      case ScreenName.historyScreen:
        result = HistoryScreen();
        break;
      case ScreenName.updateProfile:
        result = UpdateProfileScreen();
        break;
      case ScreenName.changeEmailScreen:
        result = ChangeEmailScreen();
        break;
      case ScreenName.newEmailScreen:
        result = NewEmailScreen();
        break;
      case ScreenName.changePasswordScreen:
        result = ChangePasswordScreen();
        break;
      case ScreenName.confirmChangeScreen:
        result = ConfirmChangeScreen();
        break;
      case ScreenName.changeLanguageScreen:
        result = ChangeLanguageScreen();
        break;
      case ScreenName.privacyPolicyScreen:
        result = PrivacyPolicyScreen();
        break;
      case ScreenName.termsConditionsScreen:
        result = TermsConditionsScreen();
        break;
      case ScreenName.faqScreenScreen:
        result = FAQScreenScreen();
        break;
      case ScreenName.notificationScreen:
        result = NotificationScreen();
        break;
      case ScreenName.changePhoneScreen:
        result = const ChangePhoneScreen();
        break;
      case ScreenName.verifyPhoneOtpScreen:
        result = VerifyPhoneOtpScreen(
          isRegistration: settings.arguments as bool? ?? false,
        );
        break;
      case ScreenName.verificationScreen:
        result = VerificationScreen(
          userData: settings.arguments as Map<String, dynamic>,
        );
        break;
      case ScreenName.requestScreen:
        result = RequestScreen(
          requestModel: settings.arguments as RentRequestModel,
        );
        break;
      case ScreenName.licenseUploadScreen:
        result = const LicenseUploadScreen();
        break;

      default:
        result = const Scaffold(body: Center(child: Text('Wrong path')));
    }
    return MaterialPageRoute(
      builder: (context) => result,
      settings: RouteSettings(name: settings.name),
    );
  }
}
