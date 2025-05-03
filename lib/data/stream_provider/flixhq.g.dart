// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flixhq.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$flixHQStreamHash() => r'c5d236871e769faa491abc050af4d4a5b435d818';

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

/// See also [flixHQStream].
@ProviderFor(flixHQStream)
const flixHQStreamProvider = FlixHQStreamFamily();

/// See also [flixHQStream].
class FlixHQStreamFamily extends Family<AsyncValue<List<VideoData>>> {
  /// See also [flixHQStream].
  const FlixHQStreamFamily();

  /// See also [flixHQStream].
  FlixHQStreamProvider call({
    required StreamSearchData movieData,
  }) {
    return FlixHQStreamProvider(
      movieData: movieData,
    );
  }

  @override
  FlixHQStreamProvider getProviderOverride(
    covariant FlixHQStreamProvider provider,
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
  String? get name => r'flixHQStreamProvider';
}

/// See also [flixHQStream].
class FlixHQStreamProvider extends AutoDisposeFutureProvider<List<VideoData>> {
  /// See also [flixHQStream].
  FlixHQStreamProvider({
    required StreamSearchData movieData,
  }) : this._internal(
          (ref) => flixHQStream(
            ref as FlixHQStreamRef,
            movieData: movieData,
          ),
          from: flixHQStreamProvider,
          name: r'flixHQStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$flixHQStreamHash,
          dependencies: FlixHQStreamFamily._dependencies,
          allTransitiveDependencies:
              FlixHQStreamFamily._allTransitiveDependencies,
          movieData: movieData,
        );

  FlixHQStreamProvider._internal(
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
    FutureOr<List<VideoData>> Function(FlixHQStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FlixHQStreamProvider._internal(
        (ref) => create(ref as FlixHQStreamRef),
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
    return _FlixHQStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FlixHQStreamProvider && other.movieData == movieData;
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
mixin FlixHQStreamRef on AutoDisposeFutureProviderRef<List<VideoData>> {
  /// The parameter `movieData` of this provider.
  StreamSearchData get movieData;
}

class _FlixHQStreamProviderElement
    extends AutoDisposeFutureProviderElement<List<VideoData>>
    with FlixHQStreamRef {
  _FlixHQStreamProviderElement(super.provider);

  @override
  StreamSearchData get movieData => (origin as FlixHQStreamProvider).movieData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
