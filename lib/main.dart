import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lm_labs_utils/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sudoku/app.dart';
import 'package:sudoku/firebase_options.dart';
import 'package:sudoku/src/features/shared_preferences/application/shared_preferences.dart';

part 'main.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      child: LLApp(
        initAppProvider: initAppProvider,
        appBuilder: (context) => const MyApp(),
      ),
    ),
  );
}

@Riverpod(keepAlive: true)
Future<void> initApp(InitAppRef ref) async {
  ref.onDispose(() {
    // ensure dependent providers are disposed as well
    ref.invalidate(asyncSharedPreferencesProvider);
  });

  // await for all initialization code to be complete before returning
  await [
    // // Firebase init
    // Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
    // // list of providers to be warmed up
    ref.watch(asyncSharedPreferencesProvider.future),

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  ].wait;
}
