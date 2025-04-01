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
String _$movieDetailsHash() => r'4a5022e46cfa7d24bd00a051a21db935aef54eb6';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
