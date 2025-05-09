import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/video_data.dart';

part 'auto_embed.g.dart';

class AutoEmbed {
  final baseUrl = "https://tom.autoembed.cc/api/getVideoSource";
  final List<VideoData> videoDataList = [];
  final Dio dio = Dio(BaseOptions(
    sendTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    connectTimeout: const Duration(seconds: 10),
  ));
  final headers = {
    'Referer': 'https://tom.autoembed.cc',
    'Origin': 'https://tom.autoembed.cc',
  };

  String buildUrl({
    required String imdbId,
    required String mediaType,
    String? season,
    String? episode,
  }) {
    if (mediaType == "movie") {
      return "$baseUrl/?type=movie&id=$imdbId";
    } else if (mediaType == "tv") {
      return "$baseUrl/?type=movie&id=$imdbId/$season/$episode";
    } else {
      throw Exception("Invalid media type: $mediaType");
    }
  }

  Future<List<VideoData>> scrape({required StreamSearchData movieData}) async {
    final requestUrl = buildUrl(
      imdbId: movieData.imdbId,
      mediaType: movieData.mediaType,
      season: movieData.season,
      episode: movieData.episode,
    );
    Response response = await dio.get(
      requestUrl,
      options: Options(
        headers: headers,
        responseType: ResponseType.json,
      ),
    );
    if (response.statusCode != 200) {
      return videoDataList;
    }
    final data = response.data;
    videoDataList.add(
      VideoData(
        videoSource: "AUTOEMBED1_${(videoDataList.length) + 1}",
        videoSourceUrl: data['videoSource'],
        videoSourceHeaders: {},
      ),
    );
    return videoDataList;
  }
}

@riverpod
Future<List<VideoData>> autoEmbedStream(
  ref, {
  required StreamSearchData movieData,
}) {
  try {
    return AutoEmbed().scrape(movieData: movieData);
  } catch (e) {
    return Future.value([]);
  }
}
