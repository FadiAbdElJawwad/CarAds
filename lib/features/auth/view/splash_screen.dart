import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/core/constant/images_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../../../../routes/app_router.dart';
import '../../../../routes/screen_name.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(seconds: 3));
    String? name = await storage.read(key: 'name');
    (name != null && name.isNotEmpty)  ? AppRouter.goToAndRemove(
            screenName: ScreenName.home) :
        AppRouter.goToAndRemove(screenName: ScreenName.onbording) ;
  }
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkAuth();

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
