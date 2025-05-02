import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/video_data.dart';

part 'netfree.g.dart';

class NetFree {
  final baseUrl = "https://netfree2.cc";
  final List<VideoData> videoDataList = [];
  final Dio dio = Dio();

  Future<void> getHeaders() async {
    try {
      Response response = await dio.get("https://netmirror.8man.me/api/cookie");
      if (response.statusCode == 200) {
        final data = response.data;
        if (data["cookie"] != null) {
          final cookie = data["cookie"].toString().replaceAll("Asu", "Ani");
          dio.options.headers = {
            "cookie": cookie,
          };
        } else {
          debugPrint("Cookie not found in API response");
        }
      } else {
        debugPrint("Failed to fetch headers: ${response.statusCode}");
      }
    } catch (e) {
      debugPrint("Netfree Headers Error: $e");
    }
  }

  Future<String> getId({required String title}) async {
    String movieId = "";
    try {
      Response response = await dio.get("$baseUrl/mobile/search.php?s=$title");
      Map data = response.data;
      if (data["status"] != "y") {
        return movieId;
      }
      List<dynamic> results = data["searchResult"];
      return results[0]["id"].toString();
    } catch (e) {
      debugPrint("Netfree Search Error: $e");
    }
    return movieId;
  }

  Future<List<VideoData>> scrape({required StreamSearchData movieData}) async {
    await getHeaders();
    String movieId = await getId(title: movieData.title);
    if (movieId.isEmpty) {
      return videoDataList;
    }
    Response response =
        await dio.get("$baseUrl/mobile/playlist.php?id=$movieId");
    if (response.statusCode != 200) {
      return videoDataList;
    }
    final sources = response.data[0]['sources'];
    for (Map source in sources) {
      videoDataList.add(
        VideoData(
          videoSource:
              "NETFREE_${videoDataList.length + 1} (${source["label"]}) Multi-Lang",
          videoSourceUrl: "$baseUrl${source['file']}",
        ),
      );
    }
    return videoDataList;
  }
}

@riverpod
Future<List<VideoData>> netFreeStream(
  ref, {
  required StreamSearchData movieData,
}) {
  try {
    return NetFree().scrape(movieData: movieData);
  } catch (e) {
    return Future.value([]);
  }
}
