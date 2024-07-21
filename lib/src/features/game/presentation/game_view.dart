import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sudoku/src/features/game/application/sudoku_state.dart';
import 'package:sudoku/src/features/game/domain/grid.dart';
import 'package:sudoku/src/features/game/presentation/number_keyboard.dart';
import 'package:sudoku/src/features/game/presentation/sudoku_grid.dart';

class GameView extends ConsumerWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(sudokuProvider.select((state) => state.grid.isValid),
        (prev, next) async {
      if (next) {
        await Haptics.vibrate(HapticsType.heavy);
        await Future.delayed(const Duration(milliseconds: 300));
        await Haptics.vibrate(HapticsType.heavy);
        await Future.delayed(const Duration(milliseconds: 300));
        await Haptics.vibrate(HapticsType.heavy);
        await Future.delayed(const Duration(milliseconds: 300));
        await Haptics.vibrate(HapticsType.heavy);
        await Future.delayed(const Duration(milliseconds: 300));
        await Haptics.vibrate(HapticsType.heavy);

        ref.read(sudokuProvider.notifier).reset();
      }
    });

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SudokuGrid(),
            SizedBox(height: 32),
            NumberKeyboard(),
          ],
        ),
      ),
    );
  }
}
