import 'dart:isolate';

class ScrapeStreamsData {
  final String imdbId;
  final String tmdbId;
  final String mediaType;
  final String title;
  final String year;
  final String? season;
  final String? episode;
  final SendPort? sendPort;

  ScrapeStreamsData({
    required this.imdbId,
    required this.tmdbId,
    required this.mediaType,
    required this.title,
    required this.year,
    this.season,
    this.episode,
    this.sendPort,
  });
}
