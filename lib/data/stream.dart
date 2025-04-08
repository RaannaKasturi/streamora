import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora_provider/streamora_provider.dart';
import 'package:streamora_provider/data/video_data.dart';

part 'stream.g.dart';

class Stream {
  Future<List<VideoData>> getStreams({
    required String tmdbId,
    required String title,
    required String year,
    required String mediaType,
    required String season,
    required String episode,
  }) async {
    return await StreamoraProvider().scrape(
      imdbId: tmdbId,
      mediaType: mediaType,
      title: title,
      year: year,
      season: int.tryParse(season),
      episode: int.tryParse(episode),
    );
  }
}

@riverpod
Future<List<VideoData>> videoStream(
  ref, {
  required String tmdbId,
  required String title,
  required String year,
  required String mediaType,
  required String season,
  required String episode,
}) async {
  final stream = Stream();
  return await stream.getStreams(
    tmdbId: tmdbId,
    title: title,
    year: year,
    mediaType: mediaType,
    season: season,
    episode: episode,
  );
}
