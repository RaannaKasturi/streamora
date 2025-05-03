import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/data/tmdb_provider/genres_data.dart';
import 'package:streamora/data/tmdb_provider/tmdb.dart';
import 'package:streamora/model/movie_list_data.dart';

part 'details_by_genre.g.dart';

class DetailsByGenre {
  final Tmdb tmdb = Tmdb();
  late final String baseTMDBEndpoint;
  late final Dio dio;
  late final Map<String, dynamic> headers;

  DetailsByGenre() {
    baseTMDBEndpoint = tmdb.baseTMDBEndpoint;
    dio = tmdb.dio;
    headers = tmdb.headers;
  }

  Future<List<MovieListData>> getDetailsByGenre(
      {required String genreId, required String mediaType}) async {
    String url =
        "https://api.themoviedb.org/3/discover/$mediaType?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc&with_genres=$genreId";
    final response = await dio.get(url, options: Options(headers: headers));
    if (response.statusCode != 200) {
      return [];
    }
    final moviesData = response.data['results'] as List<dynamic>;
    final List<MovieListData> moviesSeriesData = moviesData.map((movie) {
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
        releaseYear: (movie['release_date'] ?? movie['first_air_date'])
            .toString()
            .split("-")[0],
        mediaType: mediaType,
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
    return moviesSeriesData;
  }
}

@Riverpod(keepAlive: true)
Future<List<MovieListData>> getDetailsByGenre(ref,
    {required String genreId, required String mediaType}) async {
  print("Genre ID: $genreId");
  print("Media Type: $mediaType");
  return await DetailsByGenre().getDetailsByGenre(
    genreId: genreId,
    mediaType: mediaType,
  );
}
