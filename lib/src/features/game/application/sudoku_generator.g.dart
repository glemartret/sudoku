// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sudoku_generator.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sudokuGeneratorHash() => r'70c175d2690075e8ee8acacb4efd41493c12f6aa';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$SudokuGenerator extends BuildlessAutoDisposeNotifier<Grid> {
  late final String? seed;

  Grid build([
    String? seed,
  ]);
}

/// See also [SudokuGenerator].
@ProviderFor(SudokuGenerator)
const sudokuGeneratorProvider = SudokuGeneratorFamily();

/// See also [SudokuGenerator].
class SudokuGeneratorFamily extends Family<Grid> {
  /// See also [SudokuGenerator].
  const SudokuGeneratorFamily();

  /// See also [SudokuGenerator].
  SudokuGeneratorProvider call([
    String? seed,
  ]) {
    return SudokuGeneratorProvider(
      seed,
    );
  }

  @override
  SudokuGeneratorProvider getProviderOverride(
    covariant SudokuGeneratorProvider provider,
  ) {
    return call(
      provider.seed,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sudokuGeneratorProvider';
}

/// See also [SudokuGenerator].
class SudokuGeneratorProvider
    extends AutoDisposeNotifierProviderImpl<SudokuGenerator, Grid> {
  /// See also [SudokuGenerator].
  SudokuGeneratorProvider([
    String? seed,
  ]) : this._internal(
          () => SudokuGenerator()..seed = seed,
          from: sudokuGeneratorProvider,
          name: r'sudokuGeneratorProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$sudokuGeneratorHash,
          dependencies: SudokuGeneratorFamily._dependencies,
          allTransitiveDependencies:
              SudokuGeneratorFamily._allTransitiveDependencies,
          seed: seed,
        );

  SudokuGeneratorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seed,
  }) : super.internal();

  final String? seed;

  @override
  Grid runNotifierBuild(
    covariant SudokuGenerator notifier,
  ) {
    return notifier.build(
      seed,
    );
  }

  @override
  Override overrideWith(SudokuGenerator Function() create) {
    return ProviderOverride(
      origin: this,
      override: SudokuGeneratorProvider._internal(
        () => create()..seed = seed,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seed: seed,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<SudokuGenerator, Grid> createElement() {
    return _SudokuGeneratorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SudokuGeneratorProvider && other.seed == seed;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seed.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SudokuGeneratorRef on AutoDisposeNotifierProviderRef<Grid> {
  /// The parameter `seed` of this provider.
  String? get seed;
}

class _SudokuGeneratorProviderElement
    extends AutoDisposeNotifierProviderElement<SudokuGenerator, Grid>
    with SudokuGeneratorRef {
  _SudokuGeneratorProviderElement(super.provider);

  @override
  String? get seed => (origin as SudokuGeneratorProvider).seed;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
