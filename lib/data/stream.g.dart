// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getStreamHash() => r'ea64bf4bec6a2866a61ff19030918de259fafffb';

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

/// See also [getStream].
@ProviderFor(getStream)
const getStreamProvider = GetStreamFamily();

/// See also [getStream].
class GetStreamFamily extends Family<AsyncValue<List<VideoData>>> {
  /// See also [getStream].
  const GetStreamFamily();

  /// See also [getStream].
  GetStreamProvider call({
    required String tmdbId,
    required String imdbId,
    required String title,
    required String year,
    required String mediaType,
    String? season,
    String? episode,
  }) {
    return GetStreamProvider(
      tmdbId: tmdbId,
      imdbId: imdbId,
      title: title,
      year: year,
      mediaType: mediaType,
      season: season,
      episode: episode,
    );
  }

  @override
  GetStreamProvider getProviderOverride(
    covariant GetStreamProvider provider,
  ) {
    return call(
      tmdbId: provider.tmdbId,
      imdbId: provider.imdbId,
      title: provider.title,
      year: provider.year,
      mediaType: provider.mediaType,
      season: provider.season,
      episode: provider.episode,
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
  String? get name => r'getStreamProvider';
}

/// See also [getStream].
class GetStreamProvider extends AutoDisposeFutureProvider<List<VideoData>> {
  /// See also [getStream].
  GetStreamProvider({
    required String tmdbId,
    required String imdbId,
    required String title,
    required String year,
    required String mediaType,
    String? season,
    String? episode,
  }) : this._internal(
          (ref) => getStream(
            ref as GetStreamRef,
            tmdbId: tmdbId,
            imdbId: imdbId,
            title: title,
            year: year,
            mediaType: mediaType,
            season: season,
            episode: episode,
          ),
          from: getStreamProvider,
          name: r'getStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getStreamHash,
          dependencies: GetStreamFamily._dependencies,
          allTransitiveDependencies: GetStreamFamily._allTransitiveDependencies,
          tmdbId: tmdbId,
          imdbId: imdbId,
          title: title,
          year: year,
          mediaType: mediaType,
          season: season,
          episode: episode,
        );

  GetStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tmdbId,
    required this.imdbId,
    required this.title,
    required this.year,
    required this.mediaType,
    required this.season,
    required this.episode,
  }) : super.internal();

  final String tmdbId;
  final String imdbId;
  final String title;
  final String year;
  final String mediaType;
  final String? season;
  final String? episode;

  @override
  Override overrideWith(
    FutureOr<List<VideoData>> Function(GetStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetStreamProvider._internal(
        (ref) => create(ref as GetStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tmdbId: tmdbId,
        imdbId: imdbId,
        title: title,
        year: year,
        mediaType: mediaType,
        season: season,
        episode: episode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<VideoData>> createElement() {
    return _GetStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetStreamProvider &&
        other.tmdbId == tmdbId &&
        other.imdbId == imdbId &&
        other.title == title &&
        other.year == year &&
        other.mediaType == mediaType &&
        other.season == season &&
        other.episode == episode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tmdbId.hashCode);
    hash = _SystemHash.combine(hash, imdbId.hashCode);
    hash = _SystemHash.combine(hash, title.hashCode);
    hash = _SystemHash.combine(hash, year.hashCode);
    hash = _SystemHash.combine(hash, mediaType.hashCode);
    hash = _SystemHash.combine(hash, season.hashCode);
    hash = _SystemHash.combine(hash, episode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetStreamRef on AutoDisposeFutureProviderRef<List<VideoData>> {
  /// The parameter `tmdbId` of this provider.
  String get tmdbId;

  /// The parameter `imdbId` of this provider.
  String get imdbId;

  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `year` of this provider.
  String get year;

  /// The parameter `mediaType` of this provider.
  String get mediaType;

  /// The parameter `season` of this provider.
  String? get season;

  /// The parameter `episode` of this provider.
  String? get episode;
}

class _GetStreamProviderElement
    extends AutoDisposeFutureProviderElement<List<VideoData>>
    with GetStreamRef {
  _GetStreamProviderElement(super.provider);

  @override
  String get tmdbId => (origin as GetStreamProvider).tmdbId;
  @override
  String get imdbId => (origin as GetStreamProvider).imdbId;
  @override
  String get title => (origin as GetStreamProvider).title;
  @override
  String get year => (origin as GetStreamProvider).year;
  @override
  String get mediaType => (origin as GetStreamProvider).mediaType;
  @override
  String? get season => (origin as GetStreamProvider).season;
  @override
  String? get episode => (origin as GetStreamProvider).episode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
