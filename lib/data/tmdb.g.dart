// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$trendingMoviesHash() => r'2d66eaadb0633813f6a05180b6ae7bfde2682b36';

/// See also [trendingMovies].
@ProviderFor(trendingMovies)
final trendingMoviesProvider = FutureProvider<List<MovieListData>>.internal(
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
typedef TrendingMoviesRef = FutureProviderRef<List<MovieListData>>;
String _$nowPlayingMoviesHash() => r'b26226732b717337d0f73baf958c3427f57d1ef8';

/// See also [nowPlayingMovies].
@ProviderFor(nowPlayingMovies)
final nowPlayingMoviesProvider = FutureProvider<List<MovieListData>>.internal(
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
typedef NowPlayingMoviesRef = FutureProviderRef<List<MovieListData>>;
String _$seriesAiringTodayHash() => r'd14cad0955d7e43996a08597b9e614797dcd3c66';

/// See also [seriesAiringToday].
@ProviderFor(seriesAiringToday)
final seriesAiringTodayProvider = FutureProvider<List<MovieListData>>.internal(
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
typedef SeriesAiringTodayRef = FutureProviderRef<List<MovieListData>>;
String _$topratedMoviesHash() => r'8c6fb8b1f69533c0f110776d204aae00886ada72';

/// See also [topratedMovies].
@ProviderFor(topratedMovies)
final topratedMoviesProvider = FutureProvider<List<MovieListData>>.internal(
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
typedef TopratedMoviesRef = FutureProviderRef<List<MovieListData>>;
String _$topratedSeriesHash() => r'91fbe15cdbd289c07186b86fc74163190950be9c';

/// See also [topratedSeries].
@ProviderFor(topratedSeries)
final topratedSeriesProvider = FutureProvider<List<MovieListData>>.internal(
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
typedef TopratedSeriesRef = FutureProviderRef<List<MovieListData>>;
String _$upcomingMoviesHash() => r'8e2a06d8962154814d116a834ce0e77a5f88720f';

/// See also [upcomingMovies].
@ProviderFor(upcomingMovies)
final upcomingMoviesProvider = FutureProvider<List<MovieListData>>.internal(
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
typedef UpcomingMoviesRef = FutureProviderRef<List<MovieListData>>;
String _$getMoviesSeriesByGenreHash() =>
    r'286522d7bf578db5753b7f586d8e65ae307408e6';

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

/// See also [getMoviesSeriesByGenre].
@ProviderFor(getMoviesSeriesByGenre)
const getMoviesSeriesByGenreProvider = GetMoviesSeriesByGenreFamily();

/// See also [getMoviesSeriesByGenre].
class GetMoviesSeriesByGenreFamily
    extends Family<AsyncValue<List<MovieListData>>> {
  /// See also [getMoviesSeriesByGenre].
  const GetMoviesSeriesByGenreFamily();

  /// See also [getMoviesSeriesByGenre].
  GetMoviesSeriesByGenreProvider call({
    required String genreId,
    required String mediaType,
  }) {
    return GetMoviesSeriesByGenreProvider(
      genreId: genreId,
      mediaType: mediaType,
    );
  }

  @override
  GetMoviesSeriesByGenreProvider getProviderOverride(
    covariant GetMoviesSeriesByGenreProvider provider,
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
  String? get name => r'getMoviesSeriesByGenreProvider';
}

/// See also [getMoviesSeriesByGenre].
class GetMoviesSeriesByGenreProvider
    extends FutureProvider<List<MovieListData>> {
  /// See also [getMoviesSeriesByGenre].
  GetMoviesSeriesByGenreProvider({
    required String genreId,
    required String mediaType,
  }) : this._internal(
          (ref) => getMoviesSeriesByGenre(
            ref as GetMoviesSeriesByGenreRef,
            genreId: genreId,
            mediaType: mediaType,
          ),
          from: getMoviesSeriesByGenreProvider,
          name: r'getMoviesSeriesByGenreProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMoviesSeriesByGenreHash,
          dependencies: GetMoviesSeriesByGenreFamily._dependencies,
          allTransitiveDependencies:
              GetMoviesSeriesByGenreFamily._allTransitiveDependencies,
          genreId: genreId,
          mediaType: mediaType,
        );

  GetMoviesSeriesByGenreProvider._internal(
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
    FutureOr<List<MovieListData>> Function(GetMoviesSeriesByGenreRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMoviesSeriesByGenreProvider._internal(
        (ref) => create(ref as GetMoviesSeriesByGenreRef),
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
    return _GetMoviesSeriesByGenreProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMoviesSeriesByGenreProvider &&
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
mixin GetMoviesSeriesByGenreRef on FutureProviderRef<List<MovieListData>> {
  /// The parameter `genreId` of this provider.
  String get genreId;

  /// The parameter `mediaType` of this provider.
  String get mediaType;
}

class _GetMoviesSeriesByGenreProviderElement
    extends FutureProviderElement<List<MovieListData>>
    with GetMoviesSeriesByGenreRef {
  _GetMoviesSeriesByGenreProviderElement(super.provider);

  @override
  String get genreId => (origin as GetMoviesSeriesByGenreProvider).genreId;
  @override
  String get mediaType => (origin as GetMoviesSeriesByGenreProvider).mediaType;
}

String _$getMoviesSeriesByLanguageHash() =>
    r'847ae7607e694e190969eddb185d86b3f97dd18d';

/// See also [getMoviesSeriesByLanguage].
@ProviderFor(getMoviesSeriesByLanguage)
const getMoviesSeriesByLanguageProvider = GetMoviesSeriesByLanguageFamily();

/// See also [getMoviesSeriesByLanguage].
class GetMoviesSeriesByLanguageFamily
    extends Family<AsyncValue<List<MovieListData>>> {
  /// See also [getMoviesSeriesByLanguage].
  const GetMoviesSeriesByLanguageFamily();

  /// See also [getMoviesSeriesByLanguage].
  GetMoviesSeriesByLanguageProvider call({
    required String languageISO,
    required String mediaType,
  }) {
    return GetMoviesSeriesByLanguageProvider(
      languageISO: languageISO,
      mediaType: mediaType,
    );
  }

  @override
  GetMoviesSeriesByLanguageProvider getProviderOverride(
    covariant GetMoviesSeriesByLanguageProvider provider,
  ) {
    return call(
      languageISO: provider.languageISO,
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
  String? get name => r'getMoviesSeriesByLanguageProvider';
}

/// See also [getMoviesSeriesByLanguage].
class GetMoviesSeriesByLanguageProvider
    extends FutureProvider<List<MovieListData>> {
  /// See also [getMoviesSeriesByLanguage].
  GetMoviesSeriesByLanguageProvider({
    required String languageISO,
    required String mediaType,
  }) : this._internal(
          (ref) => getMoviesSeriesByLanguage(
            ref as GetMoviesSeriesByLanguageRef,
            languageISO: languageISO,
            mediaType: mediaType,
          ),
          from: getMoviesSeriesByLanguageProvider,
          name: r'getMoviesSeriesByLanguageProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMoviesSeriesByLanguageHash,
          dependencies: GetMoviesSeriesByLanguageFamily._dependencies,
          allTransitiveDependencies:
              GetMoviesSeriesByLanguageFamily._allTransitiveDependencies,
          languageISO: languageISO,
          mediaType: mediaType,
        );

  GetMoviesSeriesByLanguageProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.languageISO,
    required this.mediaType,
  }) : super.internal();

  final String languageISO;
  final String mediaType;

  @override
  Override overrideWith(
    FutureOr<List<MovieListData>> Function(
            GetMoviesSeriesByLanguageRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMoviesSeriesByLanguageProvider._internal(
        (ref) => create(ref as GetMoviesSeriesByLanguageRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        languageISO: languageISO,
        mediaType: mediaType,
      ),
    );
  }

  @override
  FutureProviderElement<List<MovieListData>> createElement() {
    return _GetMoviesSeriesByLanguageProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMoviesSeriesByLanguageProvider &&
        other.languageISO == languageISO &&
        other.mediaType == mediaType;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, languageISO.hashCode);
    hash = _SystemHash.combine(hash, mediaType.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetMoviesSeriesByLanguageRef on FutureProviderRef<List<MovieListData>> {
  /// The parameter `languageISO` of this provider.
  String get languageISO;

  /// The parameter `mediaType` of this provider.
  String get mediaType;
}

class _GetMoviesSeriesByLanguageProviderElement
    extends FutureProviderElement<List<MovieListData>>
    with GetMoviesSeriesByLanguageRef {
  _GetMoviesSeriesByLanguageProviderElement(super.provider);

  @override
  String get languageISO =>
      (origin as GetMoviesSeriesByLanguageProvider).languageISO;
  @override
  String get mediaType =>
      (origin as GetMoviesSeriesByLanguageProvider).mediaType;
}

String _$searchResultsHash() => r'd53b47b30246cc79aaa9ca73f182d3809084002f';

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

String _$seriesDetailsHash() => r'1bdcf258b81e125980e9dd068367e97d97f53151';

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

String _$seasonEpisodesHash() => r'365cd093588a943df85a91afe84b0a617954daf5';

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
