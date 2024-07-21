import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lm_labs_utils/widgets.dart';
import 'package:sudoku/src/features/game/application/sudoku_state.dart';
import 'package:sudoku/src/features/game/domain/cell.dart';

class SudokuCell extends ConsumerWidget {
  final Cell cell;

  const SudokuCell({
    required this.cell,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cellStyle = ref.watch(
      sudokuProvider.select((state) => state.cellStyle(cell)),
    );
    final isBase = ref.watch(
      sudokuProvider.select((state) => state.isBase(cell)),
    );
    final cellValue = ref.watch(
      sudokuProvider.select((state) => state.cellValue(cell)),
    );

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.merge(
          Border.all(
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Theme.of(context).colorScheme.surface,
          ),
          Border(
            top: BorderSide(
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Theme.of(context).colorScheme.surface,
              width: cell.$1 != 0 && cell.$1 % 3 == 0 ? 3 : 1,
            ),
            bottom: BorderSide(
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Theme.of(context).colorScheme.surface,
              width: cell.$1 != 8 && cell.$1 % 3 == 2 ? 3 : 1,
            ),
            left: BorderSide(
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Theme.of(context).colorScheme.surface,
              width: cell.$2 != 0 && cell.$2 % 3 == 0 ? 3 : 1,
            ),
            right: BorderSide(
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Theme.of(context).colorScheme.surface,
              width: cell.$2 != 8 && cell.$2 % 3 == 2 ? 3 : 1,
            ),
          ),
        ),
        borderRadius: BorderRadius.circular(4),
        color: switch (cellStyle) {
          CellStyle.selected => Theme.of(context).colorScheme.primary,
          CellStyle.inlined => Theme.of(context).colorScheme.secondary,
          CellStyle.none => Theme.of(context).colorScheme.surfaceContainer,
        },
      ),
      child: cellValue != null
          ? Center(
              child: Text(
                cellValue.toString(),
                style: TextStyle(
                  fontSize: isBase ? 30 : 26,
                  fontWeight: isBase ? FontWeight.w700 : FontWeight.w400,
                  color: switch (cellStyle) {
                    CellStyle.selected =>
                      Theme.of(context).colorScheme.onPrimary,
                    CellStyle.inlined =>
                      Theme.of(context).colorScheme.onSecondary,
                    CellStyle.none =>
                      Theme.of(context).colorScheme.onSurfaceVariant,
                  },
                ),
              ),
            )
          : null,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Cell>('cell', cell));
  }
}

class SudokuGrid extends ConsumerWidget {
  const SudokuGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.all(8),
        child: AspectRatio(
          aspectRatio: 1,
          child: Column(
            children: [
              for (var i = 0; i < 9; i++)
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (var j = 0; j < 9; j++)
                        Expanded(
                          child: LLTappable(
                            onTap: () async {
                              if (ref
                                  .read(sudokuProvider.notifier)
                                  .select((i, j))) {
                                await Haptics.vibrate(HapticsType.selection);
                              }
                            },
                            child: SudokuCell(
                              cell: (i, j),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      );
}
