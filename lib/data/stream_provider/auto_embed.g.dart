// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_embed.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$autoEmbedStreamHash() => r'ab2e5f1d1dd2763986f86553c761a1219d74bc78';

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

/// See also [autoEmbedStream].
@ProviderFor(autoEmbedStream)
const autoEmbedStreamProvider = AutoEmbedStreamFamily();

/// See also [autoEmbedStream].
class AutoEmbedStreamFamily extends Family<AsyncValue<List<VideoData>>> {
  /// See also [autoEmbedStream].
  const AutoEmbedStreamFamily();

  /// See also [autoEmbedStream].
  AutoEmbedStreamProvider call({
    required StreamSearchData movieData,
  }) {
    return AutoEmbedStreamProvider(
      movieData: movieData,
    );
  }

  @override
  AutoEmbedStreamProvider getProviderOverride(
    covariant AutoEmbedStreamProvider provider,
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
  String? get name => r'autoEmbedStreamProvider';
}

/// See also [autoEmbedStream].
class AutoEmbedStreamProvider
    extends AutoDisposeFutureProvider<List<VideoData>> {
  /// See also [autoEmbedStream].
  AutoEmbedStreamProvider({
    required StreamSearchData movieData,
  }) : this._internal(
          (ref) => autoEmbedStream(
            ref as AutoEmbedStreamRef,
            movieData: movieData,
          ),
          from: autoEmbedStreamProvider,
          name: r'autoEmbedStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$autoEmbedStreamHash,
          dependencies: AutoEmbedStreamFamily._dependencies,
          allTransitiveDependencies:
              AutoEmbedStreamFamily._allTransitiveDependencies,
          movieData: movieData,
        );

  AutoEmbedStreamProvider._internal(
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
    FutureOr<List<VideoData>> Function(AutoEmbedStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AutoEmbedStreamProvider._internal(
        (ref) => create(ref as AutoEmbedStreamRef),
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
    return _AutoEmbedStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AutoEmbedStreamProvider && other.movieData == movieData;
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
mixin AutoEmbedStreamRef on AutoDisposeFutureProviderRef<List<VideoData>> {
  /// The parameter `movieData` of this provider.
  StreamSearchData get movieData;
}

class _AutoEmbedStreamProviderElement
    extends AutoDisposeFutureProviderElement<List<VideoData>>
    with AutoEmbedStreamRef {
  _AutoEmbedStreamProviderElement(super.provider);

  @override
  StreamSearchData get movieData =>
      (origin as AutoEmbedStreamProvider).movieData;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
