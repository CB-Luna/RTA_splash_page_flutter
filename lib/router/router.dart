import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meraki_splash_page/pages/splash_page/splash_page.dart';
import 'package:meraki_splash_page/pages/thanks_page.dart';
import 'package:meraki_splash_page/services/navigation_service.dart';

/// The route configuration.
final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: NavigationService.navigatorKey,
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: 'home',
      pageBuilder: (context, state) => pageTransition(
        context,
        state,
        const SplashPage(),
      ),
    ),
    GoRoute(
      path: '/thanks',
      name: 'thanks',
      pageBuilder: (context, state) => pageTransition(
        context,
        state,
        const ThanksPage(),
      ),
    ),
  ],
);

CustomTransitionPage<void> pageTransition(
    BuildContext context, GoRouterState state, Widget page) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
