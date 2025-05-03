// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_by_genre.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getDetailsByGenreHash() => r'19a8e775e84276eaa4fa5049f380a50c3e58152e';

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

/// See also [getDetailsByGenre].
@ProviderFor(getDetailsByGenre)
const getDetailsByGenreProvider = GetDetailsByGenreFamily();

/// See also [getDetailsByGenre].
class GetDetailsByGenreFamily extends Family<AsyncValue<List<MovieListData>>> {
  /// See also [getDetailsByGenre].
  const GetDetailsByGenreFamily();

  /// See also [getDetailsByGenre].
  GetDetailsByGenreProvider call({
    required String genreId,
    required String mediaType,
  }) {
    return GetDetailsByGenreProvider(
      genreId: genreId,
      mediaType: mediaType,
    );
  }

  @override
  GetDetailsByGenreProvider getProviderOverride(
    covariant GetDetailsByGenreProvider provider,
  ) {
    return call(
      genreId: provider.genreId,
      mediaType: provider.mediaType,
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
  String? get name => r'getDetailsByGenreProvider';
}

/// See also [getDetailsByGenre].
class GetDetailsByGenreProvider extends FutureProvider<List<MovieListData>> {
  /// See also [getDetailsByGenre].
  GetDetailsByGenreProvider({
    required String genreId,
    required String mediaType,
  }) : this._internal(
          (ref) => getDetailsByGenre(
            ref as GetDetailsByGenreRef,
            genreId: genreId,
            mediaType: mediaType,
          ),
          from: getDetailsByGenreProvider,
          name: r'getDetailsByGenreProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getDetailsByGenreHash,
          dependencies: GetDetailsByGenreFamily._dependencies,
          allTransitiveDependencies:
              GetDetailsByGenreFamily._allTransitiveDependencies,
          genreId: genreId,
          mediaType: mediaType,
        );

  GetDetailsByGenreProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.genreId,
    required this.mediaType,
  }) : super.internal();

  final String genreId;
  final String mediaType;

  @override
  Override overrideWith(
    FutureOr<List<MovieListData>> Function(GetDetailsByGenreRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetDetailsByGenreProvider._internal(
        (ref) => create(ref as GetDetailsByGenreRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        genreId: genreId,
        mediaType: mediaType,
      ),
    );
  }

  @override
  FutureProviderElement<List<MovieListData>> createElement() {
    return _GetDetailsByGenreProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetDetailsByGenreProvider &&
        other.genreId == genreId &&
        other.mediaType == mediaType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, genreId.hashCode);
    hash = _SystemHash.combine(hash, mediaType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetDetailsByGenreRef on FutureProviderRef<List<MovieListData>> {
  /// The parameter `genreId` of this provider.
  String get genreId;

  /// The parameter `mediaType` of this provider.
  String get mediaType;
}

class _GetDetailsByGenreProviderElement
    extends FutureProviderElement<List<MovieListData>>
    with GetDetailsByGenreRef {
  _GetDetailsByGenreProviderElement(super.provider);

  @override
  String get genreId => (origin as GetDetailsByGenreProvider).genreId;
  @override
  String get mediaType => (origin as GetDetailsByGenreProvider).mediaType;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
