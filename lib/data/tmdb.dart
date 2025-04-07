import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streamora/data/api_keys.dart';
import 'package:streamora/data/genres_data.dart';
import 'package:streamora/model/episode_details_data.dart';
import 'package:streamora/model/movie_details_data.dart';
import 'package:streamora/model/movie_list_data.dart';
import 'package:streamora/model/person_list_data.dart';
import 'package:streamora/model/series_details_data.dart';
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
  final baseTMDBEndpoint =
      "https://proxy.wafflehacker.io/?destination=https://api.themoviedb.org/3";
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
            .split("-")[0],
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

    final List<PersonListData> cast =
        (moviesData['credits']['cast'] as List<dynamic>)
            .map<PersonListData>((person) {
      return PersonListData(
        name: person['name'],
        characterName: person['character'],
        profilePath: person['profile_path'] != null
            ? "https://image.tmdb.org/t/p/w500${person['profile_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/person_placeholder.png",
        id: person['id'].toString(),
      );
    }).toList();
    final List<PersonListData> crew =
        (moviesData['credits']['crew'] as List<dynamic>)
            .map<PersonListData>((person) {
      return PersonListData(
        name: person['name'],
        characterName: person['job'],
        profilePath: person['profile_path'] != null
            ? "https://image.tmdb.org/t/p/w500${person['profile_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/person_placeholder.png",
        id: person['id'].toString(),
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
          ? "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/movie_logo_placeholder.png"
          : "https://image.tmdb.org/t/p/w500$movieLogo",
      cast: cast,
      crew: crew,
    );
  }

  Future<SeriesDetailsData> getSeriesDetails({required int seriesID}) async {
    final response = await dio.get(
      "$baseTMDBEndpoint/tv/$seriesID?append_to_response=credits,similar,images&include_image_language=en,null",
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

    final List<PersonListData> cast =
        (moviesData['credits']['cast'] as List<dynamic>)
            .map<PersonListData>((person) {
      return PersonListData(
        name: person['name'],
        characterName: person['character'],
        profilePath: person['profile_path'] != null
            ? "https://image.tmdb.org/t/p/w500${person['profile_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/person_placeholder.png",
        id: person['id'].toString(),
      );
    }).toList();
    final List<PersonListData> crew =
        (moviesData['credits']['crew'] as List<dynamic>)
            .map<PersonListData>((person) {
      return PersonListData(
        name: person['name'],
        characterName: person['job'],
        profilePath: person['profile_path'] != null
            ? "https://image.tmdb.org/t/p/w500${person['profile_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/person_placeholder.png",
        id: person['id'].toString(),
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
      if (filteredLogos.isNotEmpty) {
        movieLogo = filteredLogos.first['file_path'] as String;
      }
    }

    return SeriesDetailsData(
      title: moviesData['title'] ??
          moviesData['original_title'] ??
          moviesData['name'] ??
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
      mediaType: moviesData['media_type'] ?? "tv",
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
          ? "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/movie_logo_placeholder.png"
          : "https://image.tmdb.org/t/p/w500$movieLogo",
      cast: cast,
      crew: crew,
      seasonNumber: moviesData['number_of_seasons'] ?? 0,
      episodeCount: moviesData['number_of_episodes'] ?? 0,
    );
  }

  Future<List<EpisodeDetailsData>> getSeasonEpisodesData(
      {required int seriesID, required int seasonNumber}) async {
    final response = await dio.get(
      "$baseTMDBEndpoint/tv/$seriesID/season/$seasonNumber",
      options: Options(headers: headers),
    );
    final moviesData = response.data as Map<String, dynamic>;
    final List<EpisodeDetailsData> episodes =
        (moviesData['episodes'] as List<dynamic>)
            .map<EpisodeDetailsData>((episode) {
      return EpisodeDetailsData(
        episodeTitle: episode['name'],
        stillPath: episode['still_path'] != null
            ? "https://image.tmdb.org/t/p/w500${episode['still_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/backdrop_placeholder.png",
        seasonNumber: episode['season_number'].toString(),
        episodeNumber: episode['episode_number'].toString(),
        airDate: episode['air_date'],
        runTime: episode['runtime'] != null
            ? "${(episode['runtime'] ~/ 60).floor()}h ${(episode['runtime'] % 60)}m"
            : "N/A",
        overview: episode['overview'] ?? "No overview available",
      );
    }).toList();
    return episodes;
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

@riverpod
Future<SeriesDetailsData> seriesDetails(ref, int seriesID) async {
  final tmdb = Tmdb();
  return await tmdb.getSeriesDetails(seriesID: seriesID);
}

@riverpod
class SeasonEpisodes extends _$SeasonEpisodes {
  @override
  Future<List<EpisodeDetailsData>> build(
      int seriesID, int initialSeason) async {
    final tmdb = Tmdb();
    return await tmdb.getSeasonEpisodesData(
      seriesID: seriesID,
      seasonNumber: initialSeason,
    );
  }

  Future<void> getSeasonEpisodes(int seasonNumber) async {
    state = const AsyncValue.loading();
    try {
      final tmdb = Tmdb();
      final episodes = await tmdb.getSeasonEpisodesData(
        seriesID: seriesID,
        seasonNumber: seasonNumber,
      );
      state = AsyncValue.data(episodes);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
