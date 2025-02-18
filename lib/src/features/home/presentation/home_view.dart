import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lm_labs_utils/widgets.dart';
import 'package:sudoku/src/features/home/presentation/home.i18n.dart';
import 'package:sudoku/src/routing/routes.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBar(
          title: Text('Home'.i18n),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () async {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                await ref.router.push(const SettingsRoute().location);
              },
            ),
          ],
        ),
        body: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(8),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: [
            GridTile(
              child: LLTappable.expand(
                onTap: () async => ref.router.push(const GameRoute().location),
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Center(child: Text('Game'.i18n)),
                ),
              ),
            ),
          ],
        ),
      );
}
