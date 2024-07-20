import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku/src/features/settings/presentation/settings_view.dart';

part 'settings_routes.g.dart';

@TypedGoRoute<SettingsRoute>(path: '/settings')
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsView();
}
