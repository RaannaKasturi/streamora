// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'two_embed.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$twoEmbedStreamHash() => r'0a11c32e8a73437cfb2b826a4d03cf63d5cc489b';

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

/// See also [twoEmbedStream].
@ProviderFor(twoEmbedStream)
const twoEmbedStreamProvider = TwoEmbedStreamFamily();

/// See also [twoEmbedStream].
class TwoEmbedStreamFamily extends Family<AsyncValue<List<VideoData>>> {
  /// See also [twoEmbedStream].
  const TwoEmbedStreamFamily();

  /// See also [twoEmbedStream].
  TwoEmbedStreamProvider call({
    required StreamSearchData movieData,
  }) {
    return TwoEmbedStreamProvider(
      movieData: movieData,
    );
  }

  @override
  TwoEmbedStreamProvider getProviderOverride(
    covariant TwoEmbedStreamProvider provider,
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
  String? get name => r'twoEmbedStreamProvider';
}

/// See also [twoEmbedStream].
class TwoEmbedStreamProvider
    extends AutoDisposeFutureProvider<List<VideoData>> {
  /// See also [twoEmbedStream].
  TwoEmbedStreamProvider({
    required StreamSearchData movieData,
  }) : this._internal(
          (ref) => twoEmbedStream(
            ref as TwoEmbedStreamRef,
            movieData: movieData,
          ),
          from: twoEmbedStreamProvider,
          name: r'twoEmbedStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$twoEmbedStreamHash,
          dependencies: TwoEmbedStreamFamily._dependencies,
          allTransitiveDependencies:
              TwoEmbedStreamFamily._allTransitiveDependencies,
          movieData: movieData,
        );

  TwoEmbedStreamProvider._internal(
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
    FutureOr<List<VideoData>> Function(TwoEmbedStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TwoEmbedStreamProvider._internal(
        (ref) => create(ref as TwoEmbedStreamRef),
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
    return _TwoEmbedStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TwoEmbedStreamProvider && other.movieData == movieData;
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
mixin TwoEmbedStreamRef on AutoDisposeFutureProviderRef<List<VideoData>> {
  /// The parameter `movieData` of this provider.
  StreamSearchData get movieData;
}

class _TwoEmbedStreamProviderElement
    extends AutoDisposeFutureProviderElement<List<VideoData>>
    with TwoEmbedStreamRef {
  _TwoEmbedStreamProviderElement(super.provider);

  @override
  StreamSearchData get movieData =>
      (origin as TwoEmbedStreamProvider).movieData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
