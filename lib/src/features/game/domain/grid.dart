import 'package:sudoku/src/features/game/domain/cell.dart';

const almostCompleteGrid = {
  (0, 0): 3,
  (0, 1): 9,
  (0, 2): 1,
  (0, 3): 2,
  (0, 4): 8,
  (0, 5): 6,
  (0, 6): 5,
  (0, 7): 7,
  (0, 8): 4,
  (1, 0): 4,
  (1, 1): 8,
  (1, 2): 7,
  (1, 3): 3,
  (1, 4): 5,
  (1, 5): 9,
  (1, 6): 1,
  (1, 7): 2,
  (1, 8): 6,
  (2, 0): 6,
  (2, 1): 5,
  (2, 2): 2,
  (2, 3): 7,
  (2, 4): 1,
  (2, 5): 4,
  (2, 6): 8,
  (2, 7): 3,
  (2, 8): 9,
  (3, 0): 8,
  (3, 1): 7,
  (3, 2): 5,
  (3, 3): 4,
  (3, 4): 3,
  (3, 5): 1,
  (3, 6): 6,
  (3, 7): 9,
  (3, 8): 2,
  (4, 0): 2,
  (4, 1): 1,
  (4, 2): 3,
  (4, 3): 9,
  (4, 4): 6,
  (4, 5): 7,
  (4, 6): 4,
  (4, 7): 8,
  (4, 8): 5,
  (5, 0): 9,
  (5, 1): 6,
  (5, 2): 4,
  (5, 3): 5,
  (5, 4): 2,
  (5, 5): 8,
  (5, 6): 7,
  (5, 7): 1,
  (5, 8): 3,
  (6, 0): 1,
  (6, 1): 4,
  (6, 2): 9,
  (6, 3): 6,
  (6, 4): 7,
  (6, 5): 3,
  (6, 6): 2,
  (6, 7): 5,
  (6, 8): 8,
  (7, 0): 5,
  (7, 1): 3,
  (7, 2): 8,
  (7, 3): 1,
  (7, 4): 4,
  (7, 5): 2,
  (7, 6): 9,
  (7, 7): 6,
  (7, 8): 7,
  (8, 0): 7,
  (8, 1): 2,
  (8, 2): 6,
  (8, 3): 8,
  (8, 4): 9,
  (8, 5): 5,
  (8, 6): 3,
  (8, 7): 4,
  (8, 8): null, // 1
};

const emptyGrid = {
  (0, 0): null,
  (0, 1): null,
  (0, 2): null,
  (0, 3): null,
  (0, 4): null,
  (0, 5): null,
  (0, 6): null,
  (0, 7): null,
  (0, 8): null,
  (1, 0): null,
  (1, 1): null,
  (1, 2): null,
  (1, 3): null,
  (1, 4): null,
  (1, 5): null,
  (1, 6): null,
  (1, 7): null,
  (1, 8): null,
  (2, 0): null,
  (2, 1): null,
  (2, 2): null,
  (2, 3): null,
  (2, 4): null,
  (2, 5): null,
  (2, 6): null,
  (2, 7): null,
  (2, 8): null,
  (3, 0): null,
  (3, 1): null,
  (3, 2): null,
  (3, 3): null,
  (3, 4): null,
  (3, 5): null,
  (3, 6): null,
  (3, 7): null,
  (3, 8): null,
  (4, 0): null,
  (4, 1): null,
  (4, 2): null,
  (4, 3): null,
  (4, 4): null,
  (4, 5): null,
  (4, 6): null,
  (4, 7): null,
  (4, 8): null,
  (5, 0): null,
  (5, 1): null,
  (5, 2): null,
  (5, 3): null,
  (5, 4): null,
  (5, 5): null,
  (5, 6): null,
  (5, 7): null,
  (5, 8): null,
  (6, 0): null,
  (6, 1): null,
  (6, 2): null,
  (6, 3): null,
  (6, 4): null,
  (6, 5): null,
  (6, 6): null,
  (6, 7): null,
  (6, 8): null,
  (7, 0): null,
  (7, 1): null,
  (7, 2): null,
  (7, 3): null,
  (7, 4): null,
  (7, 5): null,
  (7, 6): null,
  (7, 7): null,
  (7, 8): null,
  (8, 0): null,
  (8, 1): null,
  (8, 2): null,
  (8, 3): null,
  (8, 4): null,
  (8, 5): null,
  (8, 6): null,
  (8, 7): null,
  (8, 8): null,
};

typedef Grid = Map<Cell, int?>;

extension GridExt on Grid {
  bool get isValid =>
      _validCells && _validRows && _validColumns && _validSquares;

  bool get _validCells => keys.every(
        (cell) => this[cell] == null || this[cell]! > 0 && this[cell]! < 10,
      );

  bool get _validColumns => List.generate(9, (i) => i).every(_validColumn);

  bool get _validRows => List.generate(9, (i) => i).every(_validRow);

  bool get _validSquares => List.generate(9, (i) => i).every(_validSquare);

  bool _validColumn(int column) {
    final values = entries
        .where((entry) => entry.key.$2 == column)
        .map((entry) => entry.value!);

    return 45 == values.fold(0, (sum, value) => sum + value) &&
        values.toSet().length == values.length;
  }

  bool _validRow(int row) {
    final values = entries
        .where((entry) => entry.key.$1 == row)
        .map((entry) => entry.value!);

    return 45 == values.fold(0, (sum, value) => sum + value) &&
        values.toSet().length == values.length;
  }

  bool _validSquare(int square) {
    final row = square ~/ 3;
    final column = square % 3;

    final values = entries
        .where(
          (entry) =>
              entry.key.$1 >= row * 3 &&
              entry.key.$1 < (row + 1) * 3 &&
              entry.key.$2 >= column * 3 &&
              entry.key.$2 < (column + 1) * 3,
        )
        .map((entry) => entry.value!);

    return 45 == values.fold(0, (sum, value) => sum + value) &&
        values.toSet().length == values.length;
  }
}
