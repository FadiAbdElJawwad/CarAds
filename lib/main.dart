import 'package:car_ads/routes/app_router.dart';
import 'package:car_ads/routes/router_generator.dart';
import 'package:car_ads/routes/screen_name.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: RoutGenerator.onGenerateRoute,
      navigatorKey: AppRouter.navigatorKey,
      initialRoute: ScreenName.splash,

      // home: const MyHomePage(),
    );
  }
}
