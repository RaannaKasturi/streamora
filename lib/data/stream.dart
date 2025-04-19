import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/data/streams_scraping/streamora_base_provider.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/video_data.dart';

part 'stream.g.dart';

class Stream {
  Future<List<VideoData>> getStreams({
    required String tmdbId,
    required String imdbId,
    required String title,
    required String year,
    required String mediaType,
    String? season,
    String? episode,
  }) async {
    final videoData = await StreamoraProvider().scrape(
        movieData: ScrapeStreamsData(
      tmdbId: tmdbId,
      imdbId: imdbId,
      title: title,
      year: year,
      mediaType: mediaType,
      season: season,
      episode: episode,
    ));
    print("Video Streams Fetched Successfully: ${videoData.length}");
    return videoData;
  }
}

@riverpod
Future<List<VideoData>> getStream(
  ref, {
  required String tmdbId,
  required String imdbId,
  required String title,
  required String year,
  required String mediaType,
  String? season,
  String? episode,
}) async {
  return await Stream().getStreams(
    tmdbId: tmdbId,
    imdbId: imdbId,
    title: title,
    year: year,
    mediaType: mediaType,
    season: season,
    episode: episode,
  );
}
