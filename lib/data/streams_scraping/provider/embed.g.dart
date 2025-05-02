// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embed.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$vidsrcStreamHash() => r'05a29ccb0994910ca0f35c9b7ee5cc74b69d1d72';

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

/// See also [vidsrcStream].
@ProviderFor(vidsrcStream)
const vidsrcStreamProvider = VidsrcStreamFamily();

/// See also [vidsrcStream].
class VidsrcStreamFamily extends Family<AsyncValue<List<VideoData>>> {
  /// See also [vidsrcStream].
  const VidsrcStreamFamily();

  /// See also [vidsrcStream].
  VidsrcStreamProvider call({
    required StreamSearchData movieData,
  }) {
    return VidsrcStreamProvider(
      movieData: movieData,
    );
  }

  @override
  VidsrcStreamProvider getProviderOverride(
    covariant VidsrcStreamProvider provider,
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
  String? get name => r'vidsrcStreamProvider';
}

/// See also [vidsrcStream].
class VidsrcStreamProvider extends AutoDisposeFutureProvider<List<VideoData>> {
  /// See also [vidsrcStream].
  VidsrcStreamProvider({
    required StreamSearchData movieData,
  }) : this._internal(
          (ref) => vidsrcStream(
            ref as VidsrcStreamRef,
            movieData: movieData,
          ),
          from: vidsrcStreamProvider,
          name: r'vidsrcStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$vidsrcStreamHash,
          dependencies: VidsrcStreamFamily._dependencies,
          allTransitiveDependencies:
              VidsrcStreamFamily._allTransitiveDependencies,
          movieData: movieData,
        );

  VidsrcStreamProvider._internal(
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
    FutureOr<List<VideoData>> Function(VidsrcStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VidsrcStreamProvider._internal(
        (ref) => create(ref as VidsrcStreamRef),
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
    return _VidsrcStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VidsrcStreamProvider && other.movieData == movieData;
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
mixin VidsrcStreamRef on AutoDisposeFutureProviderRef<List<VideoData>> {
  /// The parameter `movieData` of this provider.
  StreamSearchData get movieData;
}

class _VidsrcStreamProviderElement
    extends AutoDisposeFutureProviderElement<List<VideoData>>
    with VidsrcStreamRef {
  _VidsrcStreamProviderElement(super.provider);

  @override
  StreamSearchData get movieData => (origin as VidsrcStreamProvider).movieData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
