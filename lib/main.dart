import 'package:car_ads/routes/app_router.dart';
import 'package:car_ads/routes/router_generator.dart';
import 'package:car_ads/routes/screen_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/logic/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CarAds());
}

class CarAds extends StatefulWidget {
  const CarAds({super.key});
  @override
  State<CarAds> createState() => _CarAdsState();
}

class _CarAdsState extends State<CarAds> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    const storage = FlutterSecureStorage();
    String? name = await storage.read(key: 'name');
    String initialScreen = (name != null && name.isNotEmpty)
        ? ScreenName.home
        : ScreenName.onbording;

    await Future.delayed(const Duration(seconds: 2));
    FlutterNativeSplash.remove();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppRouter.goToAndRemove(screenName: initialScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: Locale('ar'),
        supportedLocales: S.delegate.supportedLocales,
        theme: AppTheme.lightTheme,
        onGenerateRoute: RoutGenerator.onGenerateRoute,
        navigatorKey: AppRouter.navigatorKey,
        initialRoute: ScreenName.splash,
      ),
    );
  }
}
