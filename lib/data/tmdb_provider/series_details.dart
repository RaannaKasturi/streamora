import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/data/tmdb_provider/genres_data.dart';
import 'package:streamora/data/tmdb_provider/tmdb.dart';
import 'package:streamora/model/movie_list_data.dart';
import 'package:streamora/model/person_list_data.dart';
import 'package:streamora/model/series_details_data.dart';

part 'series_details.g.dart';

class SeriesDetails {
  final Tmdb tmdb = Tmdb();
  late final String baseTMDBEndpoint;
  late final Dio dio;
  late final Map<String, dynamic> headers;

  SeriesDetails() {
    baseTMDBEndpoint = tmdb.baseTMDBEndpoint;
    dio = tmdb.dio;
    headers = tmdb.headers;
  }

  Future<SeriesDetailsData> getSeriesDetails({required int seriesId}) async {
    final response = await dio.get(
      "$baseTMDBEndpoint/tv/$seriesId?append_to_response=credits,similar,images,external_ids&include_image_language=en",
      options: Options(headers: headers),
    );
    final moviesData = response.data as Map<String, dynamic>;
    final List<MovieListData> similarMovies =
        (moviesData['similar']?['results'] as List<dynamic>? ?? [])
            .map<MovieListData>((movie) {
      return MovieListData(
        id: movie['id'] ?? 0,
        title:
            movie['title'] ?? movie['original_title'] ?? movie['name'] ?? "N/A",
        backdrop: movie['backdrop_path'] != null
            ? "https://image.tmdb.org/t/p/w500${movie['backdrop_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/backdrop_placeholder.png",
        poster: movie['poster_path'] != null
            ? "https://image.tmdb.org/t/p/w500${movie['poster_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/poster_placeholder.png",
        voteAverage: (movie['vote_average'] ?? 0.0).toString().substring(0, 3),
        releaseYear: (movie['release_date'] ?? movie['first_air_date'] ?? "N/A")
            .toString()
            .split("-")[0],
        mediaType: movie['media_type'] ?? "tv",
        overview: movie['overview'] ?? "No overview available",
        genres: movie['genre_ids'] != null
            ? List<String>.from(
                (movie['genre_ids'] as List).map(
                  (e) => movie['media_type'] == "tv"
                      ? getTvGenre(e.toString())
                      : getMovieGenre(e.toString()),
                ),
              )
            : [],
      );
    }).toList();

    final List<PersonListData> cast =
        (moviesData['credits']?['cast'] as List<dynamic>? ?? []).map((person) {
      return PersonListData(
        name: person['name'] ?? "N/A",
        characterName: person['character'] ?? "N/A",
        profilePath: person['profile_path'] != null
            ? "https://image.tmdb.org/t/p/w500${person['profile_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/person_placeholder.png",
        id: person['id']?.toString() ?? "N/A",
      );
    }).toList();

    final List<PersonListData> crew =
        (moviesData['credits']?['crew'] as List<dynamic>? ?? []).map((person) {
      return PersonListData(
        name: person['name'] ?? "N/A",
        characterName: person['job'] ?? "N/A",
        profilePath: person['profile_path'] != null
            ? "https://image.tmdb.org/t/p/w500${person['profile_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/person_placeholder.png",
        id: person['id']?.toString() ?? "N/A",
      );
    }).toList();

    String? movieLogo;
    if (moviesData['images'] != null &&
        moviesData['images']['logos'] != null &&
        (moviesData['images']['logos'] as List).isNotEmpty) {
      final logos = moviesData['images']['logos'] as List<dynamic>;
      final filteredLogos = logos.where((logo) {
        final path = logo['file_path'] as String? ?? "";
        return path.endsWith('.png') ||
            path.endsWith('.jpg') ||
            path.endsWith('.jpeg');
      });
      if (filteredLogos.isNotEmpty) {
        movieLogo = filteredLogos.first['file_path'] as String?;
      }
    }

    return SeriesDetailsData(
      title: moviesData['title'] ??
          moviesData['original_title'] ??
          moviesData['name'] ??
          "Unknown Title",
      id: moviesData['id'] ?? 0,
      imdbId: moviesData['external_ids']?['imdb_id'] ?? "N/A",
      backdrop: moviesData['backdrop_path'] != null
          ? "https://image.tmdb.org/t/p/w500${moviesData['backdrop_path']}"
          : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/backdrop_placeholder.png",
      poster: moviesData['poster_path'] != null
          ? "https://image.tmdb.org/t/p/w500${moviesData['poster_path']}"
          : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/poster_placeholder.png",
      voteAverage: (moviesData['vote_average'] ?? 0.0).toString(),
      voteCount: (moviesData['vote_count'] ?? 0).toString(),
      releaseYear:
          (moviesData['release_date'] ?? moviesData['first_air_date'] ?? "N/A")
              .toString()
              .split("-")[0],
      mediaType: moviesData['media_type'] ?? "tv",
      overview: moviesData['overview'] ?? "No overview available",
      genres: moviesData['genres'] != null
          ? List<String>.from((moviesData['genres'] as List)
              .map((e) => e['name'] ?? "Unknown Genre"))
          : [],
      runtime: moviesData['episode_run_time'] != null &&
              (moviesData['episode_run_time'] as List).isNotEmpty
          ? "${(moviesData['episode_run_time'][0] ~/ 60)}h ${(moviesData['episode_run_time'][0] % 60)}m"
          : "N/A",
      tagline: moviesData['tagline'] ?? "No tagline available",
      originalLanguage: moviesData['original_language'] ?? "N/A",
      similarMovies: similarMovies,
      logo: movieLogo != null
          ? "https://image.tmdb.org/t/p/w500$movieLogo"
          : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/movie_logo_placeholder.png",
      cast: cast,
      crew: crew,
      seasonNumber: moviesData['number_of_seasons'] ?? 0,
      episodeCount: moviesData['number_of_episodes'] ?? 0,
    );
  }
}

@riverpod
Future<SeriesDetailsData> seriesDetails(ref, int seriesId) async {
  SeriesDetailsData seriesDetails =
      await SeriesDetails().getSeriesDetails(seriesId: seriesId);
  return seriesDetails;
}
