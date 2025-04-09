import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora_provider/streamora_provider.dart';
import 'package:streamora_provider/data/video_data.dart';

part 'stream.g.dart';

class Stream {
  Future<List<VideoData>> getStreams({
    required String tmdbId,
    required String imdbId,
    required String title,
    required String year,
    required String mediaType,
    int? season,
    int? episode,
  }) async {
    return await StreamoraProvider().scrape(
      tmdbId: tmdbId,
      imdbId: imdbId,
      mediaType: mediaType,
      title: title,
      year: year,
      season: season,
      episode: episode,
    );
  }
}

@riverpod
Future<List<VideoData>> videoStream(
  ref, {
  required String tmdbId,
  required String imdbId,
  required String title,
  required String year,
  required String mediaType,
  int? season,
  int? episode,
}) async {
  final stream = Stream();
  return await stream.getStreams(
    tmdbId: tmdbId,
    imdbId: imdbId,
    title: title,
    year: year,
    mediaType: mediaType,
    season: season,
    episode: episode,
  );
}
