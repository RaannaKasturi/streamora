import 'package:dio/dio.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/video_data.dart';

class FlixHQ {
  final String baseUrl = "https://flix.1anime.app";
  final Dio dio = Dio();
  final List<VideoData> videoDataList = [];

  String buildUrl({
    required String tmdbId,
    required String mediaType,
    String? season,
    String? episode,
  }) {
    if (mediaType == "movie") {
      return "$baseUrl/$mediaType/flixhq/$tmdbId";
    } else if (mediaType == "tv") {
      return "$baseUrl/$mediaType/flixhq/$tmdbId/$season/$episode";
    } else {
      throw Exception("Invalid media type: $mediaType");
    }
  }

  Future<List<VideoData>> scrape({
    required ScrapeStreamsData movieData,
  }) async {
    final requestUrl = buildUrl(
      tmdbId: movieData.tmdbId,
      mediaType: movieData.mediaType,
      season: movieData.season,
      episode: movieData.episode,
    );
    Response response = await dio.get(
      requestUrl,
      options: Options(
        responseType: ResponseType.json,
      ),
    );
    if (response.statusCode != 200) {
      return [];
    }
    final data = response.data[0];
    if (data['sources'] == null) {
      return videoDataList;
    }
    for (var source in data['sources']) {
      videoDataList.add(
        VideoData(
          videoSource:
              "FLIXHQ_${(videoDataList.length) + 1} (${source['quality']})",
          videoSourceUrl: source['url'],
          videoSourceHeaders: data['headers'] ?? {},
        ),
      );
    }
    return videoDataList;
  }
}
