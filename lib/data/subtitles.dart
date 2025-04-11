import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/model/subtitle_data.dart';

part 'subtitles.g.dart';

class Subtitles {
  final String baseurl = "https://subs.whvx.net/search/";
  final Dio dio = Dio();

  Future<List<SubtitleData>> getSubtitles({
    required String tmdbId,
    String? season,
    String? episode,
  }) async {
    List<SubtitleData> subtitles = [];
    final queryParams = {
      "id": tmdbId,
      "season": season ?? "",
      "episode": episode ?? "",
    };
    try {
      Response response = await dio.get(baseurl, queryParameters: queryParams);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        for (var item in data) {
          String subtitleLanguage = item['languageName'];
          String subtitleUrl = item['url'];
          subtitles.add(
            SubtitleData(
              subtitleLanguage: subtitleLanguage,
              subtitleUrl: subtitleUrl,
            ),
          );
        }
      } else {
        print("Error fetching subtitles: ${response.statusCode}");
        return subtitles;
      }
    } catch (e) {
      print("Error fetching subtitles: $e");
      return subtitles;
    }
    return subtitles;
  }
}

@riverpod
Future<List<SubtitleData>> subtitles(
  ref, {
  required String tmdbId,
  String? season,
  String? episode,
}) async {
  return Subtitles().getSubtitles(
    tmdbId: tmdbId,
    season: season,
    episode: episode,
  );
}
