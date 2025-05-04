import 'package:dio/dio.dart';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:streamora/model/subtitle_data.dart';

class DownloadSubs {
  Dio dio = Dio();

  final String searchUrl =
      "https://subdl.com/_next/data/but--nncc5Fg0uqE42LOb/en/search/{imdb_id}.json?slug={imdb_id}";
  final String downloadUrl =
      "https://subdl.com/_next/data/but--nncc5Fg0uqE42LOb/en/subtitle/{sd_id}/{slug}.json?slug={sd_id}&slug={slug}";

  Future<dynamic> zippedSubtitlesPath({required Directory baseDir}) async {
    final zipSubDir = Directory(path.join(baseDir.path, 'zipped_subtitles'));
    if (await zipSubDir.exists()) {
      await zipSubDir.delete(recursive: true);
    }
    await zipSubDir.create(recursive: true);
    return zipSubDir.path;
  }

  Future<dynamic> subtitlesPath({required Directory baseDir}) async {
    final zipSubDir = Directory(path.join(baseDir.path, 'subtitles'));
    if (await zipSubDir.exists()) {
      await zipSubDir.delete(recursive: true);
    }
    await zipSubDir.create(recursive: true);
    return zipSubDir.path;
  }

  Future<void> downloadZippedSubs({
    required List<String> subUrls,
    required List<String> subLangs,
    required String downloadDir,
  }) async {
    for (int i = 0; i < subUrls.length; i++) {
      final subUrl = subUrls[i];
      final subLang = subLangs[i];
      final fileName = "$subLang.zip";
      final filePath = path.join(downloadDir, fileName);
      try {
        await dio.download(subUrl, filePath);
      } catch (e) {
        debugPrint('Error downloading $fileName: $e');
      }
    }
  }

  Future<List<SubtitleData>> unzipSubtitles({
    required String zipSubDir,
    required String outputDir,
  }) async {
    final result = await compute(_unzipFilesInIsolate, {
      'zipDir': zipSubDir,
      'outDir': outputDir,
    });

    return result;
  }

  String? selectBestSubtitle(List<dynamic> subtitles) {
    List<Map<String, dynamic>> subtitleList =
        subtitles.whereType<Map<String, dynamic>>().toList();
    for (final sub in subtitleList) {
      final hi = int.tryParse(sub['hi'].toString()) ?? 0;
      if (hi == 1) {
        return "https://dl.subdl.com/subtitle/${sub['link']}";
      }
    }
    subtitleList.sort((a, b) {
      final aDownloads = int.tryParse(a['downloads'].toString()) ?? 0;
      final bDownloads = int.tryParse(b['downloads'].toString()) ?? 0;
      return bDownloads.compareTo(aDownloads);
    });

    return subtitleList.isNotEmpty
        ? "https://dl.subdl.com/subtitle/${subtitleList.first['link']}"
        : null;
  }

  Future<List<SubtitleData>> downloadSubs({required String imdbId}) async {
    final dir = await getDownloadsDirectory();
    final zipSubDir = await zippedSubtitlesPath(baseDir: dir!);
    final subDir = await subtitlesPath(baseDir: dir);
    Response response =
        await dio.get(searchUrl.replaceAll('{imdb_id}', imdbId));
    if (response.statusCode != 200) {
      throw Exception('Failed to load subtitles');
    }

    Map data = response.data['pageProps']['list'][0];
    final String sdId = data['sd_id'];
    final String slug = data['slug'];

    response = await dio.get(
        downloadUrl.replaceAll('{sd_id}', sdId).replaceAll('{slug}', slug));
    if (response.statusCode != 200) {
      throw Exception('Failed to load subtitles');
    }

    data = response.data['pageProps']['groupedSubtitles'];
    List<SubtitleData> subtitlesData = [];
    for (var langs in data.keys) {
      final String? subUrl = selectBestSubtitle(data[langs]);
      if (subUrl == null) continue;

      subtitlesData.add(
        SubtitleData(
          subtitleLanguage: langs.toString().toUpperCase(),
          subtitleUrl: subUrl,
        ),
      );
    }

    final subsUrl = subtitlesData.map((e) => e.subtitleUrl).toList();
    final subsLangs = subtitlesData.map((e) => e.subtitleLanguage).toList();

    await downloadZippedSubs(
      subUrls: subsUrl,
      subLangs: subsLangs,
      downloadDir: zipSubDir,
    );

    subtitlesData = await unzipSubtitles(
      zipSubDir: zipSubDir,
      outputDir: subDir,
    );

    return subtitlesData;
  }
}

Future<List<SubtitleData>> _unzipFilesInIsolate(
    Map<String, String> paths) async {
  final zipDir = Directory(paths['zipDir']!);
  final outDir = Directory(paths['outDir']!);
  List<SubtitleData> result = [];

  for (var file in zipDir.listSync()) {
    if (file.path.endsWith('.zip')) {
      final zipFile = File(file.path);
      final bytes = await zipFile.readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);
      final lang = path.basenameWithoutExtension(zipFile.path).toUpperCase();

      for (final archiveEntry in archive) {
        if (archiveEntry.isFile) {
          final ext = path.extension(archiveEntry.name);
          final newFileName = "$lang$ext";
          final outputPath = path.join(outDir.path, newFileName);
          final outputFile = File(outputPath);

          await outputFile.create(recursive: true);
          await outputFile.writeAsBytes(archiveEntry.content as List<int>);

          result.add(SubtitleData(
            subtitleLanguage: lang,
            subtitleUrl: outputPath,
          ));
        }
      }
    }
  }

  await zipDir.delete(recursive: true);
  return result;
}
