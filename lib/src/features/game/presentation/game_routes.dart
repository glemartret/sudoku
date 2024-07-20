import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku/src/features/game/presentation/game_view.dart';

part 'game_routes.g.dart';

@TypedGoRoute<GameRoute>(path: '/game')
class GameRoute extends GoRouteData {
  const GameRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const GameView();
}
