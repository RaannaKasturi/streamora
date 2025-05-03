// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'season_episode_details.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$seasonEpisodesHash() => r'4de2209f1d4f4e143f55435d341ad1cba2219db7';

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

abstract class _$SeasonEpisodes
    extends BuildlessAsyncNotifier<List<EpisodeDetailsData>> {
  late final int seriesID;
  late final int initialSeason;

  FutureOr<List<EpisodeDetailsData>> build(
    int seriesID,
    int initialSeason,
  );
}

/// See also [SeasonEpisodes].
@ProviderFor(SeasonEpisodes)
const seasonEpisodesProvider = SeasonEpisodesFamily();

/// See also [SeasonEpisodes].
class SeasonEpisodesFamily
    extends Family<AsyncValue<List<EpisodeDetailsData>>> {
  /// See also [SeasonEpisodes].
  const SeasonEpisodesFamily();

  /// See also [SeasonEpisodes].
  SeasonEpisodesProvider call(
    int seriesID,
    int initialSeason,
  ) {
    return SeasonEpisodesProvider(
      seriesID,
      initialSeason,
    );
  }

  @override
  SeasonEpisodesProvider getProviderOverride(
    covariant SeasonEpisodesProvider provider,
  ) {
    return call(
      provider.seriesID,
      provider.initialSeason,
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
  String? get name => r'seasonEpisodesProvider';
}

/// See also [SeasonEpisodes].
class SeasonEpisodesProvider extends AsyncNotifierProviderImpl<SeasonEpisodes,
    List<EpisodeDetailsData>> {
  /// See also [SeasonEpisodes].
  SeasonEpisodesProvider(
    int seriesID,
    int initialSeason,
  ) : this._internal(
          () => SeasonEpisodes()
            ..seriesID = seriesID
            ..initialSeason = initialSeason,
          from: seasonEpisodesProvider,
          name: r'seasonEpisodesProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$seasonEpisodesHash,
          dependencies: SeasonEpisodesFamily._dependencies,
          allTransitiveDependencies:
              SeasonEpisodesFamily._allTransitiveDependencies,
          seriesID: seriesID,
          initialSeason: initialSeason,
        );

  SeasonEpisodesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seriesID,
    required this.initialSeason,
  }) : super.internal();

  final int seriesID;
  final int initialSeason;

  @override
  FutureOr<List<EpisodeDetailsData>> runNotifierBuild(
    covariant SeasonEpisodes notifier,
  ) {
    return notifier.build(
      seriesID,
      initialSeason,
    );
  }

  @override
  Override overrideWith(SeasonEpisodes Function() create) {
    return ProviderOverride(
      origin: this,
      override: SeasonEpisodesProvider._internal(
        () => create()
          ..seriesID = seriesID
          ..initialSeason = initialSeason,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seriesID: seriesID,
        initialSeason: initialSeason,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<SeasonEpisodes, List<EpisodeDetailsData>>
      createElement() {
    return _SeasonEpisodesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SeasonEpisodesProvider &&
        other.seriesID == seriesID &&
        other.initialSeason == initialSeason;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesID.hashCode);
    hash = _SystemHash.combine(hash, initialSeason.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SeasonEpisodesRef on AsyncNotifierProviderRef<List<EpisodeDetailsData>> {
  /// The parameter `seriesID` of this provider.
  int get seriesID;

  /// The parameter `initialSeason` of this provider.
  int get initialSeason;
}

class _SeasonEpisodesProviderElement extends AsyncNotifierProviderElement<
    SeasonEpisodes, List<EpisodeDetailsData>> with SeasonEpisodesRef {
  _SeasonEpisodesProviderElement(super.provider);

  @override
  int get seriesID => (origin as SeasonEpisodesProvider).seriesID;
  @override
  int get initialSeason => (origin as SeasonEpisodesProvider).initialSeason;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
