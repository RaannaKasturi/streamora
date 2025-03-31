import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  Future<String> get countryCode async {
    final userPreferences = await SharedPreferences.getInstance();
    final countryCode = userPreferences.getString("countryCode") ?? "US";
    return countryCode;
  }

  Future<List<MovieListData>> fetchTrendingMovies() async {
    final response = await tmdb.v3.trending
        .getTrending(mediaType: MediaType.all, timeWindow: TimeWindow.week);
    final moviesData = response['results'] as List<dynamic>;
    final List<MovieListData> movies = moviesData
        .where((movie) =>
            movie["media_type"] == "movie" || movie["media_type"] == "tv")
        .map((movie) {
      return MovieListData(
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

  Future<List<MovieListData>> fetchNowPlaying() async {
    final response =
        await tmdb.v3.movies.getNowPlaying(region: await countryCode);
    final moviesData = response['results'] as List<dynamic>;
    final List<MovieListData> movies = moviesData.map((movie) {
      return MovieListData(
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
        mediaType: "movie",
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

  Future<List<MovieListData>> fetchAiringToday() async {
    final response = await tmdb.v3.tv.getAiringToday();
    final moviesData = response['results'] as List<dynamic>;
    final List<MovieListData> movies = moviesData.map((movie) {
      return MovieListData(
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
        mediaType: "tv",
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

  Future<List<MovieListData>> fetchTopratedMovies() async {
    final response = await tmdb.v3.movies.getTopRated(
      region: await countryCode,
    );
    final moviesData = response['results'] as List<dynamic>;
    final List<MovieListData> movies = moviesData.map((movie) {
      return MovieListData(
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
        mediaType: "tv",
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

  Future<List<MovieListData>> fetchTopratedSeries() async {
    final response = await tmdb.v3.tv.getTopRated();
    final moviesData = response['results'] as List<dynamic>;
    final List<MovieListData> movies = moviesData.map((movie) {
      return MovieListData(
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
        mediaType: "tv",
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

  Future<List<MovieListData>> fetchUpcomingMovies() async {
    final response = await tmdb.v3.movies.getUpcoming(
      region: await countryCode,
    );
    final moviesData = response['results'] as List<dynamic>;
    final List<MovieListData> movies = moviesData.map((movie) {
      return MovieListData(
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
        mediaType: "tv",
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
Future<List<MovieListData>> trendingMovies(ref) async {
  final tmdbClient = Tmdb();
  return await tmdbClient.fetchTrendingMovies();
}

@riverpod
Future<List<MovieListData>> nowPlayingMovies(ref) async {
  final tmdbClient = Tmdb();
  return await tmdbClient.fetchNowPlaying();
}

@riverpod
Future<List<MovieListData>> seriesAiringToday(ref) async {
  final tmdbClient = Tmdb();
  return await tmdbClient.fetchAiringToday();
}

@riverpod
Future<List<MovieListData>> topratedMovies(ref) async {
  final tmdbClient = Tmdb();
  return await tmdbClient.fetchTopratedMovies();
}

@riverpod
Future<List<MovieListData>> topratedSeries(ref) async {
  final tmdbClient = Tmdb();
  return await tmdbClient.fetchTopratedSeries();
}

@riverpod
Future<List<MovieListData>> upcomingMovies(ref) async {
  final tmdb = Tmdb();
  return await tmdb.fetchUpcomingMovies();
}
