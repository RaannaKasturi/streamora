import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/video_data.dart';

part 'vidzee.g.dart';

class Vidzee {
  Future<List<VideoData>> scrape({required StreamSearchData movieData}) async {
    final baseUrl =
        "https://vidzee.wtf/${movieData.mediaType}/player.php?id=${movieData.tmdbId}${movieData.mediaType == 'tv' ? '&season=${movieData.season}&episode=${movieData.episode}' : ''}";
    final List<VideoData> videoDataList = [];
    final Dio dio = Dio();

    try {
      Response response = await dio.get(baseUrl);
      if (response.statusCode != 200) {
        return videoDataList;
      }
      final data = response.data.toString();
      List<dynamic> servers = jsonDecode(
          "${data.split("data-stream-sources='")[1].split("]'")[0]}]");
      for (var server in servers) {
        var videoLabel = server['label'];
        var videoUrl =
            Uri.decodeFull(server['url'].toString().split("url=")[1]);
        videoDataList.add(
          VideoData(
            videoSource: 'VIDZEE_${videoDataList.length + 1} ($videoLabel)',
            videoSourceUrl: videoUrl,
            videoSourceHeaders: {},
          ),
        );
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
    return videoDataList;
  }
}

@riverpod
Future<List<VideoData>> vidzeeStream(
  ref, {
  required StreamSearchData movieData,
}) {
  try {
    return Vidzee().scrape(movieData: movieData);
  } catch (e) {
    return Future.value([]);
  }
}
