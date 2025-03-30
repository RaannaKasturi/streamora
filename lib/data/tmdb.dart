import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/data/api_keys.dart';
import 'package:streamora/data/genres_data.dart';
import 'package:streamora/model/hero_carousel.dart';
import 'package:tmdb_api/tmdb_api.dart';

part 'tmdb.g.dart';

class Tmdb {
  final tmdb = TMDB(
    ApiKeys(tmdbApiKey, tmdbApiReadAccessToken),
    logConfig: const ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ),
  );

  Future<List<HeroCarouselData>> fetchTrendingMovies() async {
    final response = await tmdb.v3.trending
        .getTrending(mediaType: MediaType.all, timeWindow: TimeWindow.week);
    final moviesData = response['results'] as List<dynamic>;
    final List<HeroCarouselData> movies = moviesData
        .where((movie) =>
            movie["media_type"] == "movie" || movie["media_type"] == "tv")
        .map((movie) {
      return HeroCarouselData(
        title: movie['title'] ?? movie['original_title'] ?? movie['name'],
        backdrop: movie['backdrop_path'] != null
            ? "https://image.tmdb.org/t/p/w500${movie['backdrop_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/backdrop_placeholder.png",
        poster: movie['poster_path'] != null
            ? "https://image.tmdb.org/t/p/w500${movie['poster_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/poster_placeholder.png",
        voteAverage: (movie['vote_average'] ?? 0.0).toString().substring(0, 3),
        releaseYear: (movie['release_date'] ?? movie['first_air_date'])
            .toString()
            .substring(0, 4),
        mediaType: movie['media_type'],
        overview: movie['overview'],
        genres: movie['genre_ids'] != null
            ? List<String>.from(movie['genre_ids'].map((e) =>
                movie['media_type'] == "tv"
                    ? getTvGenre(e.toString())
                    : getMovieGenre(e.toString())))
            : [],
      );
    }).toList();
    return movies;
  }
}

@riverpod
Future<List<HeroCarouselData>> trendingMovies(ref) async {
  final tmdbClient = Tmdb();
  return await tmdbClient.fetchTrendingMovies();
}
