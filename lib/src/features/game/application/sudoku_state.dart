import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sudoku/src/features/game/application/sudoku_generator.dart';
import 'package:sudoku/src/features/game/domain/cell.dart';
import 'package:sudoku/src/features/game/domain/grid.dart';

part 'sudoku_state.freezed.dart';
part 'sudoku_state.g.dart';

@riverpod
class Sudoku extends _$Sudoku {
  @override
  SudokuState build() {
    final generatedGrid = ref.read(sudokuGeneratorProvider());

    return SudokuState(
      baseGrid: generatedGrid,
      grid: generatedGrid,
    );
  }

  void reset() {
    ref.invalidateSelf();
  }

  bool select(Cell? cell) {
    state = state.copyWith(
      selectedCell: state.selectedCell != cell ? cell : null,
    );

    return true;
  }

  bool setValue(int? value) {
    if (state.selectedCell == null || state.isBase(state.selectedCell!)) {
      return false;
    }

    state = state.copyWith(
      grid: Map.from(state.grid)
        ..update(
          state.selectedCell!,
          (oldValue) => oldValue != value ? value : null,
        ),
    );

    return true;
  }
}

@freezed
class SudokuState with _$SudokuState {
  const factory SudokuState({
    required Grid baseGrid,
    required Grid grid,
    Cell? selectedCell,
  }) = _SudokuState;
}

extension SudokuStateExt on SudokuState {
  CellStyle Function(Cell) get cellStyle => (cell) => switch (true) {
        _ when selectedCell == cell => CellStyle.selected,
        _ when cell.$1 == selectedCell?.$1 || cell.$2 == selectedCell?.$2 =>
          CellStyle.inlined,
        _ => CellStyle.none,
      };

  int? Function(Cell) get cellValue => (cell) => grid[cell];

  bool Function(Cell) get isBase => (cell) => baseGrid[cell] != null;
}
