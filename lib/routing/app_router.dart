
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nerdy_health/app/landing/views/landing.dart';
import 'package:nerdy_health/app/log/views/log.dart';
import 'package:nerdy_health/app/profile/views/profile.dart';
import 'package:nerdy_health/home.dart';
import 'package:nerdy_health/routing/app_route.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

class AppRouter {
  GoRouter get goRouter {
    return GoRouter(
      initialLocation: AppRoute.landing.path,
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          path: AppRoute.landing.path,
          name: AppRoute.landing.name,
          pageBuilder: (context, state) {
            return const NoTransitionPage(
              child: HomeScreen(
                child: LandingScreen(),
              ),
            );
          },
        ),
        ShellRoute(
          navigatorKey: _shellNavigatorKey,
          pageBuilder: (context, state, child) =>
              NoTransitionPage(child: HomeScreen(child: child)),
          routes: [
            GoRoute(
              path: AppRoute.log.path,
              name: AppRoute.log.name,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: LogScreen()),
            ),
            GoRoute(
              path: AppRoute.profile.path,
              name: AppRoute.profile.name,
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProfileScreen()),
            ),
          ],
        ),
      ],
    );
  }
}

///
/// Provider making router available to other parts of the app
///
final goRouterProvider = Provider<GoRouter>((ref) => AppRouter().goRouter);

///
/// GoRouter extension, mainly for convenience
///
extension GoRouterExtension on GoRouter {
  String get location {
    return routerDelegate.currentConfiguration.uri.toString();
  }
}