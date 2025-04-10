// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trendingMoviesHash() => r'97989f807f9d5e4c8df9991bdce64b13778a4f80';

/// See also [trendingMovies].
@ProviderFor(trendingMovies)
final trendingMoviesProvider =
    AutoDisposeFutureProvider<List<MovieListData>>.internal(
  trendingMovies,
  name: r'trendingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trendingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TrendingMoviesRef = AutoDisposeFutureProviderRef<List<MovieListData>>;
String _$nowPlayingMoviesHash() => r'b5b4b39aa8dbca37c9075187d1075d2d142ec625';

/// See also [nowPlayingMovies].
@ProviderFor(nowPlayingMovies)
final nowPlayingMoviesProvider =
    AutoDisposeFutureProvider<List<MovieListData>>.internal(
  nowPlayingMovies,
  name: r'nowPlayingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nowPlayingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NowPlayingMoviesRef = AutoDisposeFutureProviderRef<List<MovieListData>>;
String _$seriesAiringTodayHash() => r'3b3a2a6a60246053f954b46408bff3d594af2ebb';

/// See also [seriesAiringToday].
@ProviderFor(seriesAiringToday)
final seriesAiringTodayProvider =
    AutoDisposeFutureProvider<List<MovieListData>>.internal(
  seriesAiringToday,
  name: r'seriesAiringTodayProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$seriesAiringTodayHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SeriesAiringTodayRef
    = AutoDisposeFutureProviderRef<List<MovieListData>>;
String _$topratedMoviesHash() => r'3d01b41205aa54e4aeb5183a1e65d9f1071a5226';

/// See also [topratedMovies].
@ProviderFor(topratedMovies)
final topratedMoviesProvider =
    AutoDisposeFutureProvider<List<MovieListData>>.internal(
  topratedMovies,
  name: r'topratedMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$topratedMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TopratedMoviesRef = AutoDisposeFutureProviderRef<List<MovieListData>>;
String _$topratedSeriesHash() => r'42824d88206e03f059574067d15539639fcf06d4';

/// See also [topratedSeries].
@ProviderFor(topratedSeries)
final topratedSeriesProvider =
    AutoDisposeFutureProvider<List<MovieListData>>.internal(
  topratedSeries,
  name: r'topratedSeriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$topratedSeriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TopratedSeriesRef = AutoDisposeFutureProviderRef<List<MovieListData>>;
String _$upcomingMoviesHash() => r'aa17b158a2ca23d9df97251d5ddbfc506043fef5';

/// See also [upcomingMovies].
@ProviderFor(upcomingMovies)
final upcomingMoviesProvider =
    AutoDisposeFutureProvider<List<MovieListData>>.internal(
  upcomingMovies,
  name: r'upcomingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$upcomingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UpcomingMoviesRef = AutoDisposeFutureProviderRef<List<MovieListData>>;
String _$searchResultsHash() => r'8c8f9918ca677c33a24285332ca70d6454fcf534';

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

/// See also [searchResults].
@ProviderFor(searchResults)
const searchResultsProvider = SearchResultsFamily();

/// See also [searchResults].
class SearchResultsFamily extends Family<AsyncValue<List<MovieListData>>> {
  /// See also [searchResults].
  const SearchResultsFamily();

  /// See also [searchResults].
  SearchResultsProvider call({
    required String query,
  }) {
    return SearchResultsProvider(
      query: query,
    );
  }

  @override
  SearchResultsProvider getProviderOverride(
    covariant SearchResultsProvider provider,
  ) {
    return call(
      query: provider.query,
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
  String? get name => r'searchResultsProvider';
}

/// See also [searchResults].
class SearchResultsProvider
    extends AutoDisposeFutureProvider<List<MovieListData>> {
  /// See also [searchResults].
  SearchResultsProvider({
    required String query,
  }) : this._internal(
          (ref) => searchResults(
            ref as SearchResultsRef,
            query: query,
          ),
          from: searchResultsProvider,
          name: r'searchResultsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchResultsHash,
          dependencies: SearchResultsFamily._dependencies,
          allTransitiveDependencies:
              SearchResultsFamily._allTransitiveDependencies,
          query: query,
        );

  SearchResultsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<List<MovieListData>> Function(SearchResultsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchResultsProvider._internal(
        (ref) => create(ref as SearchResultsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<MovieListData>> createElement() {
    return _SearchResultsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchResultsProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchResultsRef on AutoDisposeFutureProviderRef<List<MovieListData>> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchResultsProviderElement
    extends AutoDisposeFutureProviderElement<List<MovieListData>>
    with SearchResultsRef {
  _SearchResultsProviderElement(super.provider);

  @override
  String get query => (origin as SearchResultsProvider).query;
}

String _$movieDetailsHash() => r'4a5022e46cfa7d24bd00a051a21db935aef54eb6';

/// See also [movieDetails].
@ProviderFor(movieDetails)
const movieDetailsProvider = MovieDetailsFamily();

/// See also [movieDetails].
class MovieDetailsFamily extends Family<AsyncValue<MovieDetailsData>> {
  /// See also [movieDetails].
  const MovieDetailsFamily();

  /// See also [movieDetails].
  MovieDetailsProvider call(
    int movieID,
  ) {
    return MovieDetailsProvider(
      movieID,
    );
  }

  @override
  MovieDetailsProvider getProviderOverride(
    covariant MovieDetailsProvider provider,
  ) {
    return call(
      provider.movieID,
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
  String? get name => r'movieDetailsProvider';
}

/// See also [movieDetails].
class MovieDetailsProvider extends AutoDisposeFutureProvider<MovieDetailsData> {
  /// See also [movieDetails].
  MovieDetailsProvider(
    int movieID,
  ) : this._internal(
          (ref) => movieDetails(
            ref as MovieDetailsRef,
            movieID,
          ),
          from: movieDetailsProvider,
          name: r'movieDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$movieDetailsHash,
          dependencies: MovieDetailsFamily._dependencies,
          allTransitiveDependencies:
              MovieDetailsFamily._allTransitiveDependencies,
          movieID: movieID,
        );

  MovieDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieID,
  }) : super.internal();

  final int movieID;

  @override
  Override overrideWith(
    FutureOr<MovieDetailsData> Function(MovieDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieDetailsProvider._internal(
        (ref) => create(ref as MovieDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieID: movieID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MovieDetailsData> createElement() {
    return _MovieDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieDetailsProvider && other.movieID == movieID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieID.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MovieDetailsRef on AutoDisposeFutureProviderRef<MovieDetailsData> {
  /// The parameter `movieID` of this provider.
  int get movieID;
}

class _MovieDetailsProviderElement
    extends AutoDisposeFutureProviderElement<MovieDetailsData>
    with MovieDetailsRef {
  _MovieDetailsProviderElement(super.provider);

  @override
  int get movieID => (origin as MovieDetailsProvider).movieID;
}

String _$seriesDetailsHash() => r'9dc84a106ddcfb3e0cf40f155dc4475c93b0bce4';

/// See also [seriesDetails].
@ProviderFor(seriesDetails)
const seriesDetailsProvider = SeriesDetailsFamily();

/// See also [seriesDetails].
class SeriesDetailsFamily extends Family<AsyncValue<SeriesDetailsData>> {
  /// See also [seriesDetails].
  const SeriesDetailsFamily();

  /// See also [seriesDetails].
  SeriesDetailsProvider call(
    int seriesID,
  ) {
    return SeriesDetailsProvider(
      seriesID,
    );
  }

  @override
  SeriesDetailsProvider getProviderOverride(
    covariant SeriesDetailsProvider provider,
  ) {
    return call(
      provider.seriesID,
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
  String? get name => r'seriesDetailsProvider';
}

/// See also [seriesDetails].
class SeriesDetailsProvider
    extends AutoDisposeFutureProvider<SeriesDetailsData> {
  /// See also [seriesDetails].
  SeriesDetailsProvider(
    int seriesID,
  ) : this._internal(
          (ref) => seriesDetails(
            ref as SeriesDetailsRef,
            seriesID,
          ),
          from: seriesDetailsProvider,
          name: r'seriesDetailsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$seriesDetailsHash,
          dependencies: SeriesDetailsFamily._dependencies,
          allTransitiveDependencies:
              SeriesDetailsFamily._allTransitiveDependencies,
          seriesID: seriesID,
        );

  SeriesDetailsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.seriesID,
  }) : super.internal();

  final int seriesID;

  @override
  Override overrideWith(
    FutureOr<SeriesDetailsData> Function(SeriesDetailsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SeriesDetailsProvider._internal(
        (ref) => create(ref as SeriesDetailsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        seriesID: seriesID,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SeriesDetailsData> createElement() {
    return _SeriesDetailsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SeriesDetailsProvider && other.seriesID == seriesID;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, seriesID.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SeriesDetailsRef on AutoDisposeFutureProviderRef<SeriesDetailsData> {
  /// The parameter `seriesID` of this provider.
  int get seriesID;
}

class _SeriesDetailsProviderElement
    extends AutoDisposeFutureProviderElement<SeriesDetailsData>
    with SeriesDetailsRef {
  _SeriesDetailsProviderElement(super.provider);

  @override
  int get seriesID => (origin as SeriesDetailsProvider).seriesID;
}

String _$seasonEpisodesHash() => r'b6b1d774df88fc2121ed12e4cd44dc0463b7aff5';

abstract class _$SeasonEpisodes
    extends BuildlessAutoDisposeAsyncNotifier<List<EpisodeDetailsData>> {
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
class SeasonEpisodesProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SeasonEpisodes, List<EpisodeDetailsData>> {
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
  AutoDisposeAsyncNotifierProviderElement<SeasonEpisodes,
      List<EpisodeDetailsData>> createElement() {
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
mixin SeasonEpisodesRef
    on AutoDisposeAsyncNotifierProviderRef<List<EpisodeDetailsData>> {
  /// The parameter `seriesID` of this provider.
  int get seriesID;

  /// The parameter `initialSeason` of this provider.
  int get initialSeason;
}

class _SeasonEpisodesProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<SeasonEpisodes,
        List<EpisodeDetailsData>> with SeasonEpisodesRef {
  _SeasonEpisodesProviderElement(super.provider);

  @override
  int get seriesID => (origin as SeasonEpisodesProvider).seriesID;
  @override
  int get initialSeason => (origin as SeasonEpisodesProvider).initialSeason;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
