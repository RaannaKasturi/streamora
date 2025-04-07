import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:streamora/model/video_data.dart';

class TwoEmbed {
  final String baseUrl = "https://2embed.wafflehacker.io/scrape";
  final Dio dio = Dio(
    BaseOptions(
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.134 Safari/537.36',
        'Accept': 'application/json, text/plain, */*',
      },
      responseType: ResponseType.json,
    ),
  );

  String movieUrl(String tmdbId) {
    return "$baseUrl?id=$tmdbId";
  }

  String showUrl(String tmdbId, String seasonNumber, String episodeNumber) {
    return "$baseUrl?id=$tmdbId&s=$seasonNumber&e=$episodeNumber";
  }

  Future<List<VideoData>> scrapeVideoData(
      {required String tmdbID,
      required String mediaType,
      String season = "",
      String episode = ""}) async {
    final List<VideoData> videoDataList = [];
    final url = mediaType == "movie"
        ? movieUrl(tmdbID)
        : showUrl(tmdbID, season, episode);
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      if (response.data["embeds"] != null) {
        for (var embed in response.data["embeds"]) {
          if (embed["playlist"] != null) {
            videoDataList.add(
              VideoData(
                videoSource: "2EMBED_E${videoDataList.length + 1}",
                videoSourceUrl: embed["playlist"],
              ),
            );
          }
        }
      }
      if (response.data["stream"] != null) {
        for (var stream in response.data["stream"]) {
          if (stream["playlist"] != null) {
            videoDataList.add(
              VideoData(
                videoSource: "2EMBED_S${videoDataList.length + 1}",
                videoSourceUrl: stream["playlist"],
              ),
            );
          }
        }
      }
    } else {
      throw Exception("Failed to load video data");
    }
    return videoDataList;
  }

  Future<List<VideoData>> scrape({
    required String mediaType,
    required String tmdbID,
    String title = "",
    String year = "",
    String season = "",
    String episode = "",
  }) async {
    final List<VideoData> data = await Isolate.run(
      () async {
        List<VideoData> videoDataList = await scrapeVideoData(
          tmdbID: tmdbID,
          mediaType: mediaType,
          season: season,
          episode: episode,
        );
        return videoDataList;
      },
      debugName: "AutoEmbedScraper",
    );
    return data;
  }
}
