import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/data/subtitle_provider/download_subs.dart';
import 'package:streamora/model/subtitle_data.dart';

part 'subtitles.g.dart';

class Subtitles {
  Future<List<SubtitleData>> getSubtitles({required String imdbId}) async {
    List<SubtitleData> subtitles = [];
    try {
      subtitles = await DownloadSubs().downloadSubs(imdbId: imdbId);
    } catch (e) {
      debugPrint('Error downloading subtitles: $e');
    }
    if (subtitles.isNotEmpty) {
      for (var subtitle in subtitles) {
        debugPrint('Check Subtitle Language: ${subtitle.subtitleLanguage}');
        debugPrint('Check Subtitle URL: ${subtitle.subtitleUrl}');
      }
    } else {
      debugPrint(
        'Check Subtitle: No subtitles available for this movie/series.',
      );
    }
    return subtitles;
  }
}

@riverpod
Future<List<SubtitleData>> subtitles(ref, {required String imdbId}) async {
  return Subtitles().getSubtitles(imdbId: imdbId);
}
