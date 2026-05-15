import 'dart:io';
import 'package:car_ads/core/app_logger.dart';
import 'package:car_ads/features/add_ads/logic/provider/add_ads_provider.dart';
import 'package:car_ads/features/explore/logic/provider/car_ads_provider.dart';
import 'package:car_ads/features/home/logic/provider/map_provider.dart';
import 'package:car_ads/features/nav_button_bar/provider/nav_button_provider.dart';
import 'package:car_ads/features/profile/logic/provider/change_email_provider.dart';
import 'package:car_ads/features/profile/logic/provider/language_provider.dart';
import 'package:car_ads/features/profile/logic/provider/change_phone_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/routes/app_router.dart';
import 'core/routes/router_generator.dart';
import 'core/services/redirect_service.dart';
import 'core/themes/light_theme.dart';
import 'features/auth/logic/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'features/notifications/logic/provider/notification_provider.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'features/history/logic/provider/history_provider.dart';

import 'core/services/notification_service.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // Initialize Notification Service
  await NotificationService().initialize();

  runApp(const CarAds());
}

class CarAds extends StatelessWidget {
  const CarAds({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => NavButtonProvider()),
        ChangeNotifierProvider(create: (_) => HistoryProvider()),
        ChangeNotifierProvider(create: (_) => MapProvider()),
        ChangeNotifierProvider(create: (_) => CarAdsProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ChangeEmailProvider()),
        ChangeNotifierProvider(create: (_) => AddAdsProvider()),
        ChangeNotifierProvider(create: (_) => NotificationProvider()),
        ChangeNotifierProvider(create: (_) => ChangePhoneProvider()),
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: languageProvider.locale,
            supportedLocales: S.delegate.supportedLocales,
            theme: AppTheme.lightTheme,
            onGenerateRoute: RouteGenerator.onGenerateRoute,
            navigatorKey: AppRouter.navigatorKey,
            home: const InitializerWidget(),
          );
        },
      ),
    );
  }
}

class InitializerWidget extends StatefulWidget {
  const InitializerWidget({super.key});

  @override
  State<InitializerWidget> createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  Future<void> getToken() async {
    String? mytoken = await FirebaseMessaging.instance.getToken();
    AppLogger.info('Firebase Token: $mytoken');
  }

  @override
  void initState() {
    super.initState();
    getToken();
    _determineInitialRoute();
  }

  void _determineInitialRoute() async {
    final redirectService = RedirectService.instance;
    final determinedRoute = await redirectService.getInitialScreen();
    if (mounted) {
      Navigator.of(context).pushReplacementNamed(determinedRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
