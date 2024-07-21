import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sudoku/src/features/game/domain/grid.dart';
import 'package:sudoku_dart/sudoku_dart.dart' as s;

part 'sudoku_generator.g.dart';

@riverpod
class SudokuGenerator extends _$SudokuGenerator {
  @override
  Grid build([String? seed]) {
    final now = DateTime.now();
    final effectiveSeed =
        seed?.hashCode ?? DateTime(now.year, now.month, now.day).hashCode;

    print('Seed : $effectiveSeed');
    final random = Random(effectiveSeed);

    final sudoku = s.Sudoku.generate(s.Level.easy);
    final grid = {
      for (var i = 0; i < 9; i++)
        for (var j = 0; j < 9; j++)
          (i, j):
              sudoku.puzzle[i * 9 + j] == -1 ? null : sudoku.puzzle[i * 9 + j],
    };

    return grid;
  }
}
