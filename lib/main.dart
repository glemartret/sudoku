import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lm_labs_utils/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sudoku/app.dart';
import 'package:sudoku/firebase_options.dart';
import 'package:sudoku/src/features/shared_preferences/application/shared_preferences.dart';

part 'main.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Fetch remote config
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setDefaults({
    'SENTRY_SAMPLE_RATE': 1.0,
  });
  if (remoteConfig.lastFetchStatus == RemoteConfigFetchStatus.noFetchYet) {
    await remoteConfig.fetchAndActivate().timeout(const Duration(seconds: 5));
  } else {
    await remoteConfig.activate();
    unawaited(remoteConfig.fetch());
  }

  // Get the sample rate from remote config
  final sentrySampleRate =
      remoteConfig.getDouble('SENTRY_SAMPLE_RATE').clamp(0.0, 1.0);
  final sentryDsn = remoteConfig.getString('SENTRY_DSN');

  if (sentryDsn.isNotEmpty) {
    await SentryFlutter.init(
      (options) {
        options
          ..dsn = sentryDsn
          ..sampleRate = sentrySampleRate
          ..beforeSend = (event, hint) async {
            // Only send reports in release mode
            if (!kReleaseMode) {
              return null;
            }
            // For all other events, return the event as is
            return event;
          }
          ..attachScreenshot = true;
      },
    );
  }

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
