import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/video_data.dart';

part 'vidsrc_su.g.dart';

class VidsrcSu {
  List<String> extractUrls(String input) {
    final regex = RegExp(
        r"url:\s*'(https?://[^\']+)'"); // Match URLs starting with http or https
    final matches = regex.allMatches(input);
    return matches.map((match) => match.group(1)!).toList();
  }

  Future<List<VideoData>> scrape({required StreamSearchData movieData}) async {
    List<VideoData> videoDataList = [];
    final baseUrl = "https://vidsrc.su/embed";
    final headers = {
      'accept': '*/*',
    };

    final Dio dio = Dio();
    final path =
        "$baseUrl/${movieData.mediaType == "movie" ? "movie/${movieData.tmdbId}" : "tv/${movieData.tmdbId}/${movieData.season}/${movieData.episode}"}";
    Response response = await dio.get(path, options: Options(headers: headers));
    if (response.statusCode != 200) {
      return videoDataList;
    }
    List<String> servers = extractUrls(response.data
        .toString()
        .split("const fixedServers = ")[1]
        .split("];")[0]);
    for (var server in servers) {
      Map<String, dynamic>? tempHeaders;
      if (server.contains("proxy-m3u8.uira.live")) {
        String oldServer = server;
        server = Uri.decodeFull(server.split("?url=")[1].split("&amp;")[0]);
        tempHeaders =
            jsonDecode(Uri.decodeFull(oldServer.split("headers=")[1]));
      }
      videoDataList.add(
        VideoData(
          videoSource: "VIDSRC_${videoDataList.length + 1}",
          videoSourceUrl: server,
          videoSourceHeaders: tempHeaders ??
              {
                'Referer': 'https://vidsrc.su/',
                'Origin': 'https://vidsrc.su',
              },
        ),
      );
    }
    return videoDataList;
  }
}

@riverpod
Future<List<VideoData>> vidsrcStream(
  ref, {
  required StreamSearchData movieData,
}) {
  try {
    return VidsrcSu().scrape(movieData: movieData);
  } catch (e) {
    return Future.value([]);
  }
}
