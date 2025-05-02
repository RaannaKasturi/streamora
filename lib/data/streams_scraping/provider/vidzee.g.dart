// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vidzee.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vidzeeStreamHash() => r'458956b90a808d4104d295c95e5022c191bdf8be';

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

/// See also [vidzeeStream].
@ProviderFor(vidzeeStream)
const vidzeeStreamProvider = VidzeeStreamFamily();

/// See also [vidzeeStream].
class VidzeeStreamFamily extends Family<AsyncValue<List<VideoData>>> {
  /// See also [vidzeeStream].
  const VidzeeStreamFamily();

  /// See also [vidzeeStream].
  VidzeeStreamProvider call({
    required StreamSearchData movieData,
  }) {
    return VidzeeStreamProvider(
      movieData: movieData,
    );
  }

  @override
  VidzeeStreamProvider getProviderOverride(
    covariant VidzeeStreamProvider provider,
  ) {
    return call(
      movieData: provider.movieData,
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
  String? get name => r'vidzeeStreamProvider';
}

/// See also [vidzeeStream].
class VidzeeStreamProvider extends AutoDisposeFutureProvider<List<VideoData>> {
  /// See also [vidzeeStream].
  VidzeeStreamProvider({
    required StreamSearchData movieData,
  }) : this._internal(
          (ref) => vidzeeStream(
            ref as VidzeeStreamRef,
            movieData: movieData,
          ),
          from: vidzeeStreamProvider,
          name: r'vidzeeStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vidzeeStreamHash,
          dependencies: VidzeeStreamFamily._dependencies,
          allTransitiveDependencies:
              VidzeeStreamFamily._allTransitiveDependencies,
          movieData: movieData,
        );

  VidzeeStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieData,
  }) : super.internal();

  final StreamSearchData movieData;

  @override
  Override overrideWith(
    FutureOr<List<VideoData>> Function(VidzeeStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VidzeeStreamProvider._internal(
        (ref) => create(ref as VidzeeStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieData: movieData,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<VideoData>> createElement() {
    return _VidzeeStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VidzeeStreamProvider && other.movieData == movieData;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieData.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VidzeeStreamRef on AutoDisposeFutureProviderRef<List<VideoData>> {
  /// The parameter `movieData` of this provider.
  StreamSearchData get movieData;
}

class _VidzeeStreamProviderElement
    extends AutoDisposeFutureProviderElement<List<VideoData>>
    with VidzeeStreamRef {
  _VidzeeStreamProviderElement(super.provider);

  @override
  StreamSearchData get movieData => (origin as VidzeeStreamProvider).movieData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
