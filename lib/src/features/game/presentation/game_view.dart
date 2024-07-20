import 'package:flutter/material.dart';
import 'package:sudoku/src/features/game/presentation/number_keyboard.dart';
import 'package:sudoku/src/features/game/presentation/sudoku_grid.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
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
