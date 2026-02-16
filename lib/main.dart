import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/routes/app_router.dart';
import 'core/routes/router_generator.dart';
import 'core/services/redirect_service.dart';
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
  runApp(const CarAds());
}

class CarAds extends StatefulWidget {
  const CarAds({super.key});

  @override
  State<CarAds> createState() => _CarAdsState();
}

class _CarAdsState extends State<CarAds> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        locale: const Locale('en'),
        supportedLocales: S.delegate.supportedLocales,
        theme: AppTheme.lightTheme,
        onGenerateRoute: RouteGenerator.onGenerateRoute,
        navigatorKey: AppRouter.navigatorKey,
        home: const InitializerWidget(),
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
  @override
  void initState() {
    super.initState();
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
