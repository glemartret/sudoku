// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $gameRoute,
    ];

RouteBase get $gameRoute => GoRouteData.$route(
      path: '/game',
      factory: $GameRouteExtension._fromState,
    );

extension $GameRouteExtension on GameRoute {
  static GameRoute _fromState(GoRouterState state) => const GameRoute();

  String get location => GoRouteData.$location(
        '/game',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

// **************************************************************************
// RoutesGenerator
// **************************************************************************

List<RouteBase> get $gameRoutes => $appRoutes;
