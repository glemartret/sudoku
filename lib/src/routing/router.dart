import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sudoku/src/routing/routes.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

  final router = GoRouter(
    navigatorKey: routerKey,
    initialLocation: const GameRoute().location,
    debugLogDiagnostics: true,
    routes: $appRoutes,
  );

  ref.onDispose(router.dispose);

  return router;
}

extension RefRouterExt on Ref {
  GoRouter get router => read(routerProvider);
}

extension WidgetRefRouterExt on WidgetRef {
  GoRouter get router => read(routerProvider);
}
