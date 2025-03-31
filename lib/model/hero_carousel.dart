class MovieListData {
  String title;
  String backdrop;
  String poster;
  String voteAverage;
  String releaseYear;
  String mediaType;
  String overview;
  List<String>? genres;

  MovieListData({
    required this.title,
    required this.backdrop,
    required this.poster,
    required this.voteAverage,
    required this.releaseYear,
    required this.mediaType,
    required this.overview,
    required this.genres,
  });
}
