import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/video_data.dart';

part 'x_prime_appolo.g.dart';

class XPrimeAppolo {
  final baseUrl = "https://kendrickl-3amar.site";
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
    required String tmdbId,
    required String mediaType,
    String? season,
    String? episode,
  }) {
    if (mediaType == "movie") {
      return "$baseUrl/$tmdbId";
    } else if (mediaType == "tv") {
      return "$baseUrl/$tmdbId/$season/$episode";
    } else {
      throw Exception("Invalid media type: $mediaType");
    }
  }

  Future<List<VideoData>> scrape({required StreamSearchData movieData}) async {
    String finalUrl = buildUrl(
      tmdbId: movieData.tmdbId,
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
          videoSource: "XPRIMEAPPOLO_${videoDataList.length + 1}",
          videoSourceUrl: stream,
          videoSourceHeaders: {},
        ),
      );
    }
    return videoDataList;
  }
}

@riverpod
Future<List<VideoData>> xPrimeAppoloStream(
  ref, {
  required StreamSearchData movieData,
}) {
  try {
    return XPrimeAppolo().scrape(movieData: movieData);
  } catch (e) {
    return Future.value([]);
  }
}
