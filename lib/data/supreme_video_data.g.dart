// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supreme_video_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$supremeVideoDataHash() => r'c7d9279fb8c9e5b922b054428b3f3a1be07c1b31';

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

/// See also [supremeVideoData].
@ProviderFor(supremeVideoData)
const supremeVideoDataProvider = SupremeVideoDataFamily();

/// See also [supremeVideoData].
class SupremeVideoDataFamily extends Family<AsyncValue<List<VideoData>>> {
  /// See also [supremeVideoData].
  const SupremeVideoDataFamily();

  /// See also [supremeVideoData].
  SupremeVideoDataProvider call({
    required String tmdbId,
    required String title,
    required String year,
    required String mediaType,
    required String season,
    required String episode,
  }) {
    return SupremeVideoDataProvider(
      tmdbId: tmdbId,
      title: title,
      year: year,
      mediaType: mediaType,
      season: season,
      episode: episode,
    );
  }

  @override
  SupremeVideoDataProvider getProviderOverride(
    covariant SupremeVideoDataProvider provider,
  ) {
    return call(
      tmdbId: provider.tmdbId,
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
  String? get name => r'supremeVideoDataProvider';
}

/// See also [supremeVideoData].
class SupremeVideoDataProvider
    extends AutoDisposeFutureProvider<List<VideoData>> {
  /// See also [supremeVideoData].
  SupremeVideoDataProvider({
    required String tmdbId,
    required String title,
    required String year,
    required String mediaType,
    required String season,
    required String episode,
  }) : this._internal(
          (ref) => supremeVideoData(
            ref as SupremeVideoDataRef,
            tmdbId: tmdbId,
            title: title,
            year: year,
            mediaType: mediaType,
            season: season,
            episode: episode,
          ),
          from: supremeVideoDataProvider,
          name: r'supremeVideoDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$supremeVideoDataHash,
          dependencies: SupremeVideoDataFamily._dependencies,
          allTransitiveDependencies:
              SupremeVideoDataFamily._allTransitiveDependencies,
          tmdbId: tmdbId,
          title: title,
          year: year,
          mediaType: mediaType,
          season: season,
          episode: episode,
        );

  SupremeVideoDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.tmdbId,
    required this.title,
    required this.year,
    required this.mediaType,
    required this.season,
    required this.episode,
  }) : super.internal();

  final String tmdbId;
  final String title;
  final String year;
  final String mediaType;
  final String season;
  final String episode;

  @override
  Override overrideWith(
    FutureOr<List<VideoData>> Function(SupremeVideoDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SupremeVideoDataProvider._internal(
        (ref) => create(ref as SupremeVideoDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        tmdbId: tmdbId,
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
    return _SupremeVideoDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SupremeVideoDataProvider &&
        other.tmdbId == tmdbId &&
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
mixin SupremeVideoDataRef on AutoDisposeFutureProviderRef<List<VideoData>> {
  /// The parameter `tmdbId` of this provider.
  String get tmdbId;

  /// The parameter `title` of this provider.
  String get title;

  /// The parameter `year` of this provider.
  String get year;

  /// The parameter `mediaType` of this provider.
  String get mediaType;

  /// The parameter `season` of this provider.
  String get season;

  /// The parameter `episode` of this provider.
  String get episode;
}

class _SupremeVideoDataProviderElement
    extends AutoDisposeFutureProviderElement<List<VideoData>>
    with SupremeVideoDataRef {
  _SupremeVideoDataProviderElement(super.provider);

  @override
  String get tmdbId => (origin as SupremeVideoDataProvider).tmdbId;
  @override
  String get title => (origin as SupremeVideoDataProvider).title;
  @override
  String get year => (origin as SupremeVideoDataProvider).year;
  @override
  String get mediaType => (origin as SupremeVideoDataProvider).mediaType;
  @override
  String get season => (origin as SupremeVideoDataProvider).season;
  @override
  String get episode => (origin as SupremeVideoDataProvider).episode;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
