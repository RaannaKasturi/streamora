import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/data/video_providers/auto_embed.dart';
import 'package:streamora/data/video_providers/two_embed.dart';
import 'package:streamora/model/video_data.dart';

part 'supreme_video_data.g.dart';

class SupremeVideoData {
  final List providerList = [
    TwoEmbed(),
    AutoEmbed(),
    // Add more providers here
  ];

  Future<List<VideoData>> getVideoData({
    required String mediaType,
    required String tmdbId,
    required String title,
    required String year,
    String season = "",
    String episode = "",
  }) async {
    List<VideoData> videoDataList = [];
    for (var provider in providerList) {
      final List<VideoData> data = await provider.scrape(
        tmdbID: tmdbId,
        title: title,
        year: year,
        mediaType: mediaType,
        season: season,
        episode: episode,
      );
      if (data.isNotEmpty) {
        videoDataList.addAll(data);
      }
    }
    return videoDataList;
  }
}

@riverpod
Future<List<VideoData>> supremeVideoData(
  ref, {
  required String tmdbId,
  required String title,
  required String year,
  required String mediaType,
  required String season,
  required String episode,
}) async {
  final svd = SupremeVideoData();
  return await svd.getVideoData(
    mediaType: mediaType,
    tmdbId: tmdbId,
    title: title,
    year: year,
    season: season,
    episode: episode,
  );
}

void main() async {
  final provider = SupremeVideoData();
  List<VideoData> movieData = await provider.getVideoData(
    tmdbId: "447273",
    title: "Holland",
    year: "2025",
    mediaType: "movie",
    // season: "",
    // episode: "",
  );
  for (var data in movieData) {
    print("Movie Video Source: ${data.videoSource}");
    print("Movie Video Source URL: ${data.videoSourceUrl}");
  }
}
