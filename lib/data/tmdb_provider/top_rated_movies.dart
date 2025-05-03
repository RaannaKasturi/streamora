import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/data/tmdb_provider/genres_data.dart';
import 'package:streamora/data/tmdb_provider/tmdb.dart';
import 'package:streamora/model/movie_list_data.dart';

part 'top_rated_movies.g.dart';

class TopRatedMovies {
  final Tmdb tmdb = Tmdb();
  late final String baseTMDBEndpoint;
  late final Dio dio;
  late final Map<String, dynamic> headers;
  late final String countryCode;

  TopRatedMovies() {
    baseTMDBEndpoint = tmdb.baseTMDBEndpoint;
    dio = tmdb.dio;
    headers = tmdb.headers;
  }

  Future<List<MovieListData>> getTopRatedMovies() async {
    final String countryCode = await tmdb.countryCode;
    final response = await dio.get(
      "$baseTMDBEndpoint/movie/top_rated?region=$countryCode",
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
        mediaType: "movie",
        overview: movie['overview'],
        genres: movie['genre_ids'] != null
            ? List<String>.from(
                movie['genre_ids'].map(
                  (e) => movie['media_type'] == "tv"
                      ? getTvGenre(e.toString())
                      : getMovieGenre(
                          e.toString(),
                        ),
                ),
              )
            : [],
      );
    }).toList();
    return movies;
  }
}

@Riverpod(keepAlive: true)
Future<List<MovieListData>> topRatedMovies(ref) async {
  return await TopRatedMovies().getTopRatedMovies();
}
