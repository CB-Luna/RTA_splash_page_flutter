import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:meraki_splash_page/providers/providers.dart';
import 'package:meraki_splash_page/router/router.dart';

import 'helpers/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: anonKey,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SplashPageProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('es');

  void setLocale(Locale value) => setState(() => _locale = value);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'RTA Splash Page',
      debugShowCheckedModeBanner: false,
      locale: _locale,
      supportedLocales: const [Locale('en', 'US')],
      theme: ThemeData(
        brightness: Brightness.light,
        dividerColor: Colors.grey,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        dividerColor: Colors.grey,
      ),
      routerConfig: router,
    );
  }
}
