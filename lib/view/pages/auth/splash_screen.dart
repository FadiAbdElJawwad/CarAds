import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/shared_preferences.dart';
import '../../../routes/app_router.dart';
import '../../../routes/screen_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {

      newuser == false ? AppRouter.goToAndRemove(
          screenName: ScreenName.onbording) :
      AppRouter.goToAndRemove(screenName: ScreenName.login) ;
      // AppRouter.goToAndRemove(screenName: ScreenName.onbording);
    });
    checkIfAlreadyLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.mainColor,
      body:Column(
        children: [
          Image.asset(ImagesManager.splash,),
          Text('Welcome to CarAds App',style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),),
          SizedBox(height: 10,),
          Text('Your Gateway to Car Showrooms and Rental Offices',style: TextStyle(fontSize: 12, color: Colors.white),)
        ],
      )
    );
  }
}
