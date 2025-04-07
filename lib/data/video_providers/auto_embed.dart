import 'dart:isolate';
import 'package:dio/dio.dart';
import 'package:streamora/model/video_data.dart';

class AutoEmbed {
  final String baseUrl = "https://nono.autoembed.cc/api/getVideoSource";
  final String decryptUrl = "https://nono.autoembed.cc/api/decryptVideoSource";
  final Dio dio = Dio(
    BaseOptions(
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.134 Safari/537.36',
        'Accept': 'application/json, text/plain, */*',
        'Referer': 'https://nono.autoembed.cc/',
        'Origin': 'https://nono.autoembed.cc',
      },
      responseType: ResponseType.json,
    ),
  );

  String movieUrl(String tmdbId) {
    return "$baseUrl?type=movie&id=$tmdbId";
  }

  String showUrl(String tmdbId, String seasonNumber, String episodeNumber) {
    return "$baseUrl?type=tv&id=$tmdbId/$seasonNumber/$episodeNumber";
  }

  Future<List<VideoData>> scrapeVideoData(
      {required String tmdbID,
      required String mediaType,
      String season = "",
      String episode = ""}) async {
    final List<VideoData> videoDataList = <VideoData>[];
    final url = mediaType == "movie"
        ? movieUrl(tmdbID)
        : showUrl(tmdbID, season, episode);
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final encodedData = response.data;
      final decryptResponse = await dio.post(decryptUrl,
          data: encodedData, options: Options(headers: dio.options.headers));
      if (decryptResponse.statusCode == 200) {
        final data = decryptResponse.data;
        if (data["videoSource"] != null) {
          videoDataList.add(VideoData(
            videoSource: "AUTOEMBED_VS${videoDataList.length + 1}",
            videoSourceUrl: data["videoSource"],
          ));
        }
      } else {
        throw Exception("Failed to decrypt video data");
      }
    } else {
      throw Exception("Failed to load video data");
    }
    return videoDataList;
  }

  Future<List<VideoData>> scrape({
    required String mediaType,
    String tmdbID = "",
    String title = "",
    String year = "",
    String season = "",
    String episode = "",
  }) async {
    List<VideoData> data;
    try {
      data = await Isolate.run(
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
    } catch (e) {
      print("⚠️ AutoEmbed scraping error: $e");
      data = [];
    }
    return data;
  }
}

// Example usage
void main() async {
  final autoEmbed = AutoEmbed();
  try {
    final videoData = await autoEmbed.scrape(
      tmdbID: "447273",
      mediaType: "movie",
    );
    for (var video in videoData) {
      print("Video Source: ${video.videoSource}");
      print("Video Source URL: ${video.videoSourceUrl}");
    }
  } catch (e) {
    print("Error: $e");
  }
}
