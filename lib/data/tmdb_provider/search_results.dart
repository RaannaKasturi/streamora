import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/data/tmdb_provider/genres_data.dart';
import 'package:streamora/data/tmdb_provider/tmdb.dart';
import 'package:streamora/model/movie_list_data.dart';

part 'search_results.g.dart';

class SearchResults {
  final Tmdb tmdb = Tmdb();
  late final String baseTMDBEndpoint;
  late final Dio dio;
  late final Map<String, dynamic> headers;

  SearchResults() {
    baseTMDBEndpoint = tmdb.baseTMDBEndpoint;
    dio = tmdb.dio;
    headers = tmdb.headers;
  }

  Future<List<MovieListData>> getSearchResults({required String query}) async {
    final String countryCode = await tmdb.countryCode;
    final response = await dio.get(
      "$baseTMDBEndpoint/search/multi?query=$query&include_adult=false&language=en-US&page=1&region=$countryCode",
      options: Options(headers: headers),
    );
    final moviesData = response.data['results'] as List<dynamic>;
    final List<MovieListData> movies = moviesData.map((movie) {
      return MovieListData(
        id: movie['id'] ?? 0,
        title: movie['title'] ??
            movie['original_title'] ??
            movie['name'] ??
            "Unknown Title",
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
        mediaType: movie['media_type'],
        overview: movie['overview'] ?? "No overview available",
        genres: movie['genre_ids'] != null
            ? List<String>.from(
                movie['genre_ids'].map(
                  (e) => movie['media_type'] == "tv"
                      ? getTvGenre(e.toString())
                      : getMovieGenre(e.toString()),
                ),
              )
            : [],
      );
    }).toList();
    return movies;
  }
}

@riverpod
Future<List<MovieListData>> searchResults(ref, {required String query}) async {
  final data = await SearchResults().getSearchResults(query: query);
  return data;
}
