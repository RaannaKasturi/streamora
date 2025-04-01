import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streamora/data/api_keys.dart';
import 'package:streamora/data/genres_data.dart';
import 'package:streamora/model/movie_details_data.dart';
import 'package:streamora/model/movie_list_data.dart';
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
  final baseTMDBEndpoint = "https://api.themoviedb.org/3";
  final dio = Dio(BaseOptions(
    followRedirects: true,
  ));
  final headers = {
    "Authorization": "Bearer $tmdbApiReadAccessToken",
  };
  Future<String> get countryCode async {
    final userPreferences = await SharedPreferences.getInstance();
    final countryCode = userPreferences.getString("countryCode") ?? "US";
    return countryCode;
  }

  Future<List<MovieListData>> fetchTrendingMovies() async {
    final response = await dio.get(
      "$baseTMDBEndpoint/trending/all/week",
      options: Options(headers: headers),
    );
    final moviesData = response.data['results'] as List<dynamic>;
    final List<MovieListData> movies = moviesData
        .where((movie) =>
            movie["media_type"] == "movie" || movie["media_type"] == "tv")
        .map((movie) {
      return MovieListData(
        id: movie['id'],
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
    final response = await dio.get(
      "$baseTMDBEndpoint/movie/now_playing?region=IN",
      options: Options(headers: headers),
    );
    final moviesData = response.data['results'] as List<dynamic>;
    final List<MovieListData> movies = moviesData.map((movie) {
      return MovieListData(
        id: movie['id'],
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
    final response = await dio.get(
      "$baseTMDBEndpoint/tv/airing_today?region=IN",
      options: Options(headers: headers),
    );
    final moviesData = response.data['results'] as List<dynamic>;
    final List<MovieListData> movies = moviesData.map((movie) {
      return MovieListData(
        id: movie['id'],
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
    final response = await dio.get(
      "$baseTMDBEndpoint/movie/top_rated?region=IN",
      options: Options(headers: headers),
    );
    final moviesData = response.data['results'] as List<dynamic>;
    final List<MovieListData> movies = moviesData.map((movie) {
      return MovieListData(
        id: movie['id'],
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
    final response = await dio.get(
      "$baseTMDBEndpoint/tv/top_rated?region=IN",
      options: Options(headers: headers),
    );
    final moviesData = response.data['results'] as List<dynamic>;
    final List<MovieListData> movies = moviesData.map((movie) {
      return MovieListData(
        id: movie['id'],
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
    final response = await dio.get(
      "$baseTMDBEndpoint/movie/upcoming?region=IN",
      options: Options(headers: headers),
    );
    final moviesData = response.data['results'] as List<dynamic>;
    final List<MovieListData> movies = moviesData.map((movie) {
      return MovieListData(
        id: movie['id'],
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

  Future<MovieDetailsData> getMovieDetails({required int movieID}) async {
    final response = await dio.get(
      "$baseTMDBEndpoint/movie/$movieID?append_to_response=credits,similar,images&include_image_language=en,null",
      options: Options(headers: headers),
    );
    final moviesData = response.data as Map<String, dynamic>;
    final List<MovieListData> similarMovies =
        (moviesData['similar']['results'] as List<dynamic>)
            .map<MovieListData>((movie) {
      return MovieListData(
        id: movie['id'],
        title: movie['title'] ?? movie['original_title'] ?? movie['name'],
        backdrop: movie['backdrop_path'] != null
            ? "https://image.tmdb.org/t/p/w500${movie['backdrop_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/backdrop_placeholder.png",
        poster: movie['poster_path'] != null
            ? "https://image.tmdb.org/t/p/w500${movie['poster_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/poster_placeholder.png",
        voteAverage: (movie['vote_average'] ?? 0.0).toString().substring(0, 3),
        releaseYear:
            (movie['release_date'] ?? movie['first_air_date']).toString(),
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

    String? movieLogo;
    if (moviesData['images'] != null &&
        moviesData['images']['logos'] != null &&
        (moviesData['images']['logos'] as List).isNotEmpty) {
      final logos = moviesData['images']['logos'] as List<dynamic>;
      final filteredLogos = logos.where((logo) {
        final path = logo['file_path'] as String;
        return path.endsWith('.png') ||
            path.endsWith('.jpg') ||
            path.endsWith('.jpeg');
      });
      print("Filtered logos: $filteredLogos");
      if (filteredLogos.isNotEmpty) {
        movieLogo = filteredLogos.first['file_path'] as String;
      }
    }

    return MovieDetailsData(
      title: moviesData['title'] ??
          moviesData['original_title'] ??
          "Unknown Title",
      id: moviesData['id'],
      backdrop: moviesData['backdrop_path'] != null
          ? "https://image.tmdb.org/t/p/w500${moviesData['backdrop_path']}"
          : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/backdrop_placeholder.png",
      poster: moviesData['poster_path'] != null
          ? "https://image.tmdb.org/t/p/w500${moviesData['poster_path']}"
          : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/poster_placeholder.png",
      voteAverage: (moviesData['vote_average'] ?? 0.0).toString(),
      voteCount: (moviesData['vote_count'] ?? 0).toString(),
      releaseYear: (moviesData['release_date'] ?? moviesData['first_air_date'])
          .toString()
          .split("-")[0],
      mediaType: moviesData['media_type'] ?? "movie",
      overview: moviesData['overview'] ?? "No overview available",
      genres: moviesData["genres"] != null
          ? List<String>.from(moviesData["genres"].map((e) => e["name"]))
          : [],
      runtime: moviesData['runtime'] != null
          ? "${(moviesData['runtime'] ~/ 60).floor()}h ${(moviesData['runtime'] % 60)}m"
          : "N/A",
      tagline: moviesData['tagline'] ?? "No tagline available",
      originalLanguage: moviesData['original_language'] ?? "N/A",
      similarMovies: similarMovies,
      logo: movieLogo == null
          ? "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/logo_placeholder.png"
          : "https://image.tmdb.org/t/p/w500$movieLogo",
    );
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

@riverpod
Future<MovieDetailsData> movieDetails(ref, int movieID) async {
  final tmdb = Tmdb();
  return await tmdb.getMovieDetails(movieID: movieID);
}
