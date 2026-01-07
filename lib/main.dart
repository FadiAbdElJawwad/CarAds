import 'package:car_ads/routes/app_router.dart';
import 'package:car_ads/routes/router_generator.dart';
import 'package:car_ads/routes/screen_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'core/themes/light_theme.dart';
import 'features/auth/logic/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  const storage = FlutterSecureStorage();

  final onboarding = await storage.read(key: 'onboarding');
  final login = await storage.read(key: 'login');

  String initialScreen;

  if (onboarding == null) {
    initialScreen = ScreenName.onbording;
  } else if (login == null) {
    initialScreen = ScreenName.login;
  } else {
    initialScreen = ScreenName.navButtonBar;
  }

  runApp(CarAds(
    initialScreen: initialScreen,
  ));
}

class CarAds extends StatelessWidget {
  const CarAds({super.key, required this.initialScreen});
  final String initialScreen;
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
        locale: const Locale('en'),
        supportedLocales: S.delegate.supportedLocales,
        theme: AppTheme.lightTheme,
        onGenerateRoute: RoutGenerator.onGenerateRoute,
        navigatorKey: AppRouter.navigatorKey,
        initialRoute: initialScreen,
      ),
    );
  }
}
