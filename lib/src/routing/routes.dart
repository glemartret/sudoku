import 'package:go_router/go_router.dart';
import 'package:sudoku/src/features/counter/presentation/counter_routes.dart';
import 'package:sudoku/src/features/home/presentation/home_routes.dart';
import 'package:sudoku/src/features/jokes/presentation/jokes_routes.dart';
import 'package:sudoku/src/features/sample_feature/presentation/sample_feature_routes.dart';
import 'package:sudoku/src/features/settings/presentation/settings_routes.dart';

export 'package:sudoku/src/features/counter/presentation/counter_routes.dart'
    hide $appRoutes;
export 'package:sudoku/src/features/home/presentation/home_routes.dart'
    hide $appRoutes;
export 'package:sudoku/src/features/jokes/presentation/jokes_routes.dart'
    hide $appRoutes;
export 'package:sudoku/src/features/sample_feature/presentation/sample_feature_routes.dart'
    hide $appRoutes;
export 'package:sudoku/src/features/settings/presentation/settings_routes.dart'
    hide $appRoutes;

export 'router.dart' show RefRouterExt, WidgetRefRouterExt;

List<RouteBase> get $appRoutes => [
      ...$homeRoutes,
      ...$counterRoutes,
      ...$jokesRoutes,
      ...$sampleFeatureRoutes,
      ...$settingsRoutes,
    ];
