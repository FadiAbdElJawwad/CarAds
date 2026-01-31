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
  String? _initialRoute;

  @override
  void initState() {
    super.initState();
    _handleRoute();
  }

  void _handleRoute() async {
    final redirectService = RedirectService.instance;
    final determinedRoute = await redirectService.getInitialScreen();

    if (mounted) {
      setState(() {
        _initialRoute = determinedRoute;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_initialRoute == null) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

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
        onGenerateRoute: RoutGenerator.onGenerateRoute,
        navigatorKey: AppRouter.navigatorKey,
        initialRoute: _initialRoute,
      ),
    );
  }
}
