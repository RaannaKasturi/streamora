import 'package:streamora/model/movie_list_data.dart';
import 'package:streamora/model/person_list_data.dart';

class MovieDetailsData {
  final String title;
  final int id;
  final String backdrop;
  final String poster;
  final String logo;
  final String voteAverage;
  final String voteCount;
  final String releaseYear;
  final String mediaType;
  final String overview;
  final List<String>? genres;
  final String runtime;
  final String tagline;
  final String originalLanguage;
  final List<MovieListData> similarMovies;
  final List<PersonListData> cast;
  final List<PersonListData> crew;

  MovieDetailsData({
    required this.title,
    required this.id,
    required this.backdrop,
    required this.poster,
    required this.logo,
    required this.voteAverage,
    required this.voteCount,
    required this.releaseYear,
    required this.mediaType,
    required this.overview,
    required this.genres,
    required this.runtime,
    required this.tagline,
    required this.originalLanguage,
    required this.similarMovies,
    required this.cast,
    required this.crew,
  });
}
