import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/video_data.dart';

class XPrimeFox {
  final baseUrl = "https://xprime.tv/foxtemp?pstream=true";
  final List<VideoData> videoDataList = [];
  final Dio dio = Dio(BaseOptions(
    sendTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    connectTimeout: const Duration(seconds: 10),
  ));
  final headers = {
    'Referer': 'pstream.org',
    'Origin': 'pstream.org',
  };

  String buildUrl({
    required String title,
    required String mediaType,
    String? season,
    String? episode,
  }) {
    if (mediaType == "movie") {
      return "$baseUrl&name=${title.replaceAll(" ", "+")}";
    } else if (mediaType == "tv") {
      return "$baseUrl&name=${title.replaceAll(" ", "+")}&season=$season&episode=$episode";
    } else {
      throw Exception("Invalid media type: $mediaType");
    }
  }

  Future<List<VideoData>> scrape({required ScrapeStreamsData movieData}) async {
    String finalUrl = buildUrl(
      title: movieData.title,
      mediaType: movieData.mediaType,
      season: movieData.season,
      episode: movieData.episode,
    );
    Response response = await dio.get(
      finalUrl,
      options: Options(
        headers: headers,
        responseType: ResponseType.json,
      ),
    );
    if (response.statusCode != 200) {
      return videoDataList;
    }
    String stream = jsonDecode(response.data)['url'];
    if (stream.contains(".m3u8")) {
      videoDataList.add(
        VideoData(
          videoSource: "XPRIMEFOX_${videoDataList.length + 1}",
          videoSourceUrl: stream,
          videoSourceHeaders: {
            "referer": "https://megacloud.store/",
            "origin": "https://megacloud.store"
          },
        ),
      );
    }
    return videoDataList;
  }
}
