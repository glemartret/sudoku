// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sudoku_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SudokuState {
  Map<(int, int), int?> get baseGrid => throw _privateConstructorUsedError;
  Map<(int, int), int?> get grid => throw _privateConstructorUsedError;
  (int, int)? get selectedCell => throw _privateConstructorUsedError;

  /// Create a copy of SudokuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SudokuStateCopyWith<SudokuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SudokuStateCopyWith<$Res> {
  factory $SudokuStateCopyWith(
          SudokuState value, $Res Function(SudokuState) then) =
      _$SudokuStateCopyWithImpl<$Res, SudokuState>;
  @useResult
  $Res call(
      {Map<(int, int), int?> baseGrid,
      Map<(int, int), int?> grid,
      (int, int)? selectedCell});
}

/// @nodoc
class _$SudokuStateCopyWithImpl<$Res, $Val extends SudokuState>
    implements $SudokuStateCopyWith<$Res> {
  _$SudokuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SudokuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseGrid = null,
    Object? grid = null,
    Object? selectedCell = freezed,
  }) {
    return _then(_value.copyWith(
      baseGrid: null == baseGrid
          ? _value.baseGrid
          : baseGrid // ignore: cast_nullable_to_non_nullable
              as Map<(int, int), int?>,
      grid: null == grid
          ? _value.grid
          : grid // ignore: cast_nullable_to_non_nullable
              as Map<(int, int), int?>,
      selectedCell: freezed == selectedCell
          ? _value.selectedCell
          : selectedCell // ignore: cast_nullable_to_non_nullable
              as (int, int)?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SudokuStateImplCopyWith<$Res>
    implements $SudokuStateCopyWith<$Res> {
  factory _$$SudokuStateImplCopyWith(
          _$SudokuStateImpl value, $Res Function(_$SudokuStateImpl) then) =
      __$$SudokuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<(int, int), int?> baseGrid,
      Map<(int, int), int?> grid,
      (int, int)? selectedCell});
}

/// @nodoc
class __$$SudokuStateImplCopyWithImpl<$Res>
    extends _$SudokuStateCopyWithImpl<$Res, _$SudokuStateImpl>
    implements _$$SudokuStateImplCopyWith<$Res> {
  __$$SudokuStateImplCopyWithImpl(
      _$SudokuStateImpl _value, $Res Function(_$SudokuStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SudokuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseGrid = null,
    Object? grid = null,
    Object? selectedCell = freezed,
  }) {
    return _then(_$SudokuStateImpl(
      baseGrid: null == baseGrid
          ? _value._baseGrid
          : baseGrid // ignore: cast_nullable_to_non_nullable
              as Map<(int, int), int?>,
      grid: null == grid
          ? _value._grid
          : grid // ignore: cast_nullable_to_non_nullable
              as Map<(int, int), int?>,
      selectedCell: freezed == selectedCell
          ? _value.selectedCell
          : selectedCell // ignore: cast_nullable_to_non_nullable
              as (int, int)?,
    ));
  }
}

/// @nodoc

class _$SudokuStateImpl implements _SudokuState {
  const _$SudokuStateImpl(
      {required final Map<(int, int), int?> baseGrid,
      required final Map<(int, int), int?> grid,
      this.selectedCell})
      : _baseGrid = baseGrid,
        _grid = grid;

  final Map<(int, int), int?> _baseGrid;
  @override
  Map<(int, int), int?> get baseGrid {
    if (_baseGrid is EqualUnmodifiableMapView) return _baseGrid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_baseGrid);
  }

  final Map<(int, int), int?> _grid;
  @override
  Map<(int, int), int?> get grid {
    if (_grid is EqualUnmodifiableMapView) return _grid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_grid);
  }

  @override
  final (int, int)? selectedCell;

  @override
  String toString() {
    return 'SudokuState(baseGrid: $baseGrid, grid: $grid, selectedCell: $selectedCell)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SudokuStateImpl &&
            const DeepCollectionEquality().equals(other._baseGrid, _baseGrid) &&
            const DeepCollectionEquality().equals(other._grid, _grid) &&
            (identical(other.selectedCell, selectedCell) ||
                other.selectedCell == selectedCell));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_baseGrid),
      const DeepCollectionEquality().hash(_grid),
      selectedCell);

  /// Create a copy of SudokuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SudokuStateImplCopyWith<_$SudokuStateImpl> get copyWith =>
      __$$SudokuStateImplCopyWithImpl<_$SudokuStateImpl>(this, _$identity);
}

abstract class _SudokuState implements SudokuState {
  const factory _SudokuState(
      {required final Map<(int, int), int?> baseGrid,
      required final Map<(int, int), int?> grid,
      final (int, int)? selectedCell}) = _$SudokuStateImpl;

  @override
  Map<(int, int), int?> get baseGrid;
  @override
  Map<(int, int), int?> get grid;
  @override
  (int, int)? get selectedCell;

  /// Create a copy of SudokuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SudokuStateImplCopyWith<_$SudokuStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
