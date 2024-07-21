import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lm_labs_utils/widgets.dart';
import 'package:sudoku/src/features/game/application/sudoku_state.dart';

class KeyboardKey extends ConsumerWidget {
  final int value;

  const KeyboardKey({
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = ref.watch(
      sudokuProvider.select((state) => state.grid[state.selectedCell] == value),
    );

    return LLTappable(
      onTap: () async {
        if (ref.read(sudokuProvider.notifier).setValue(value)) {
          await Haptics.vibrate(HapticsType.selection);
        }
      },
      child: SizedBox.square(
        dimension: 48,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surfaceContainer,
          ),
          child: Center(
            child: Text(
              '$value',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: isSelected
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('value', value));
  }
}

class NumberKeyboard extends StatelessWidget {
  const NumberKeyboard({super.key});

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KeyboardKey(
                    value: 1,
                  ),
                  SizedBox(width: 16),
                  KeyboardKey(
                    value: 2,
                  ),
                  SizedBox(width: 16),
                  KeyboardKey(
                    value: 3,
                  ),
                  SizedBox(width: 16),
                  KeyboardKey(
                    value: 4,
                  ),
                  SizedBox(width: 16),
                  KeyboardKey(
                    value: 5,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KeyboardKey(
                    value: 6,
                  ),
                  SizedBox(width: 16),
                  KeyboardKey(
                    value: 7,
                  ),
                  SizedBox(width: 16),
                  KeyboardKey(
                    value: 8,
                  ),
                  SizedBox(width: 16),
                  KeyboardKey(
                    value: 9,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
