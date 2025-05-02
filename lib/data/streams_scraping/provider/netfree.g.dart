// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'netfree.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$netFreeStreamHash() => r'2179daad48da015eefbaa4d7a81d83996c4107f6';

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

/// See also [netFreeStream].
@ProviderFor(netFreeStream)
const netFreeStreamProvider = NetFreeStreamFamily();

/// See also [netFreeStream].
class NetFreeStreamFamily extends Family<AsyncValue<List<VideoData>>> {
  /// See also [netFreeStream].
  const NetFreeStreamFamily();

  /// See also [netFreeStream].
  NetFreeStreamProvider call({
    required StreamSearchData movieData,
  }) {
    return NetFreeStreamProvider(
      movieData: movieData,
    );
  }

  @override
  NetFreeStreamProvider getProviderOverride(
    covariant NetFreeStreamProvider provider,
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
  String? get name => r'netFreeStreamProvider';
}

/// See also [netFreeStream].
class NetFreeStreamProvider extends AutoDisposeFutureProvider<List<VideoData>> {
  /// See also [netFreeStream].
  NetFreeStreamProvider({
    required StreamSearchData movieData,
  }) : this._internal(
          (ref) => netFreeStream(
            ref as NetFreeStreamRef,
            movieData: movieData,
          ),
          from: netFreeStreamProvider,
          name: r'netFreeStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$netFreeStreamHash,
          dependencies: NetFreeStreamFamily._dependencies,
          allTransitiveDependencies:
              NetFreeStreamFamily._allTransitiveDependencies,
          movieData: movieData,
        );

  NetFreeStreamProvider._internal(
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
    FutureOr<List<VideoData>> Function(NetFreeStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NetFreeStreamProvider._internal(
        (ref) => create(ref as NetFreeStreamRef),
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
    return _NetFreeStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NetFreeStreamProvider && other.movieData == movieData;
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
mixin NetFreeStreamRef on AutoDisposeFutureProviderRef<List<VideoData>> {
  /// The parameter `movieData` of this provider.
  StreamSearchData get movieData;
}

class _NetFreeStreamProviderElement
    extends AutoDisposeFutureProviderElement<List<VideoData>>
    with NetFreeStreamRef {
  _NetFreeStreamProviderElement(super.provider);

  @override
  StreamSearchData get movieData => (origin as NetFreeStreamProvider).movieData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
