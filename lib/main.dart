import 'package:car_ads/core/constant/color_manager.dart';
import 'package:car_ads/routes/app_router.dart';
import 'package:car_ads/routes/router_generator.dart';
import 'package:car_ads/routes/screen_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale('en'),
      supportedLocales: S.delegate.supportedLocales,
      theme: ThemeData(
        primaryColor: ColorManager.backgroundColor,
        scaffoldBackgroundColor: ColorManager.backgroundColor,

        elevatedButtonTheme:
        ElevatedButtonThemeData(style:
        ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: TextStyle(color: Colors.white),
            fixedSize: Size(double.maxFinite, 50),
            backgroundColor:
            ColorManager.primaryColor)),

      ),
      onGenerateRoute: RoutGenerator.onGenerateRoute,
      navigatorKey: AppRouter.navigatorKey,
      initialRoute: ScreenName.splash,

      // home: const MyHomePage(),
    );
  }
}
