///
/// Defines all routes (locations) leading to a screen on this app.
///
enum AppRoute {
  landing,
  log,
  profile,
}

extension AppRouteExtension on AppRoute {
  String get path {
    return this == AppRoute.landing ? '/' : '/$name';
  }

  String get subpath {
    return name;
  }
}