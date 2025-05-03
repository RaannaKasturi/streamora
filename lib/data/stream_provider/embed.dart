import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/core/common/util.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/video_data.dart';

part 'embed.g.dart';

class Embed {
  final baseUrl = "https://embed.su";
  final List<VideoData> videoDataList = [];
  final Dio dio = Dio(BaseOptions(
    sendTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    connectTimeout: const Duration(seconds: 10),
  ));
  final headers = {
    'Referer': 'https://embed.su',
    'Origin': 'https://embed.su',
  };

  String buildUrl({
    required String tmdbId,
    required String mediaType,
    String? season,
    String? episode,
  }) {
    if (mediaType == "movie") {
      return "$baseUrl/embed/movie/$tmdbId";
    } else if (mediaType == "tv") {
      return "$baseUrl/embed/tv/$tmdbId/$season/$episode";
    } else {
      throw Exception("Invalid media type: $mediaType");
    }
  }

  List<String> extractStreamIds({required String rawData}) {
    final encodedData = rawData.toString().split("atob(`")[1].split("`));")[0];
    final encodedHash =
        jsonDecode(base64Decoder(encodedData: encodedData))['hash'];
    final decodedHashList = base64Decoder(encodedData: encodedHash).split(".");
    final streamDataList = jsonDecode(base64Decoder(
        encodedData: "${decodedHashList[1]}${decodedHashList[0]}"));
    List<String> streamIds = [];
    for (Map streamData in streamDataList) {
      streamIds.add(streamData['hash'].toString());
    }
    return streamIds;
  }

  Future<List<String>> extractVideoStreamUrls(
      {required List<String> streamIds}) async {
    List<String> videoSourceUrls = [];
    for (String streamId in streamIds) {
      String streamUrl = "$baseUrl/api/e/$streamId";
      Response streamResponse = await dio.get(
        streamUrl,
        options: Options(headers: headers, responseType: ResponseType.json),
      );
      if (streamResponse.statusCode == 200 &&
          streamResponse.data.toString().contains("source")) {
        Map streamData = streamResponse.data;
        videoSourceUrls.add(streamData['source'].toString());
      }
    }
    return videoSourceUrls;
  }

  Future<List<VideoData>> getStreams(
      {required List<String> videoSourceUrls}) async {
    for (String videoSourceUrl in videoSourceUrls) {
      try {
        Response response = await dio.get(
          videoSourceUrl,
          options: Options(headers: headers),
        );
        List<String> resolutions = [];
        List<String> streamUrls = [];

        for (String line in response.data.toString().split("\n")) {
          final resolutionMatch =
              RegExp(r'RESOLUTION=(\d{3,4})x(\d{3,4})').firstMatch(line);
          if (resolutionMatch != null) {
            resolutions.add(resolutionMatch.group(2)!);
          }

          final urlMatch = RegExp(r'^/api/.*.png$').firstMatch(line);
          if (urlMatch != null) {
            String url = urlMatch.group(0)!;
            streamUrls.add("$baseUrl${url.replaceAll('.png', '.m3u8')}");
          }
        }

        for (int i = 0; i < streamUrls.length && i < resolutions.length; i++) {
          videoDataList.add(
            VideoData(
              videoSource:
                  "EMBED_${videoDataList.length + 1} (${resolutions[i]}p)",
              videoSourceUrl: streamUrls[i],
              videoSourceHeaders: headers,
            ),
          );
        }
      } catch (e) {
        continue;
      }
    }
    return videoDataList;
  }

  Future<List<VideoData>> scrape({required StreamSearchData movieData}) async {
    String requestUrl = buildUrl(
      tmdbId: movieData.tmdbId,
      mediaType: movieData.mediaType,
      season: movieData.season,
      episode: movieData.episode,
    );
    Response response = await dio.get(
      requestUrl,
      options: Options(
        headers: headers,
      ),
    );
    if (response.statusCode != 200) {
      return videoDataList;
    }
    List<String> streamIds = extractStreamIds(rawData: response.data);
    List<String> videoSourceUrlsList =
        await extractVideoStreamUrls(streamIds: streamIds);
    await getStreams(videoSourceUrls: videoSourceUrlsList);
    return videoDataList;
  }
}

@riverpod
Future<List<VideoData>> vidsrcStream(
  ref, {
  required StreamSearchData movieData,
}) {
  try {
    return Embed().scrape(movieData: movieData);
  } catch (e) {
    return Future.value([]);
  }
}
