import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/video_data.dart';

part 'two_embed.g.dart';

class TwoEmbed {
  final Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
  ));
  final List<VideoData> videoDataList = [];
  final String baseUrl = "https://uqloads.xyz/e/";
  final headers = {
    'Origin': 'uqloads.xyz',
    'Referer': 'https://streamsrcs.2embed.cc/',
  };

  Future<String?> getStreamId({required StreamSearchData movieData}) async {
    String url = "https://www.2embed.cc/embed/";
    if (movieData.mediaType == "tv" &&
        movieData.season != null &&
        movieData.episode != null) {
      url +=
          "${movieData.tmdbId}/season-${movieData.season}-episode-${movieData.episode}";
    } else {
      url += movieData.tmdbId;
    }

    final response = await dio.get(url, options: Options(headers: headers));
    if (response.statusCode == 200) {
      final soup = BeautifulSoup(response.data);
      final iframe = soup.find('iframe');
      final dataSrc = iframe?.attributes['data-src'];
      if (dataSrc != null) {
        final streamId = dataSrc.split("?id=")[1].split("&")[0];
        return streamId;
      }
    } else {
      return null;
    }
    return null;
  }

  String intToBase(int x, int base) {
    const digits = '0123456789abcdefghijklmnopqrstuvwxyz';
    if (x < 0) return '-${intToBase(-x, base)}';
    if (x < base) return digits[x];
    return intToBase(x ~/ base, base) + digits[x % base];
  }

  String jsObfuscationReplacer(String p, int a, int c, List<String> k) {
    for (int i = c - 1; i >= 0; i--) {
      if (k[i].isNotEmpty) {
        String baseA = intToBase(i, a);
        p = p.replaceAll(RegExp('\\b$baseA\\b'), k[i]);
      }
    }
    return p;
  }

  Map<String, dynamic> getPack(String packed) {
    final p = "${packed.split("}',")[0]}'}";
    final k = "|${packed.split(",'|")[1].split("'.split")[0]}";
    final ac = packed.split("}',")[1].split(",'|")[0];
    final a = int.parse(ac.split(",")[0]);
    final c = int.parse(ac.split(",")[1]);
    final keyList = k.split("|");
    return {"p": p, "a": a, "c": c, "k": keyList};
  }

  String? extractVideoSource(String htmlContent) {
    final soup = BeautifulSoup(htmlContent);
    final scriptTags = soup.findAll('script');

    for (var script in scriptTags) {
      final scriptText = script.string;
      if (scriptText.isNotEmpty &&
          scriptText.trim().startsWith("eval(function(p,a,c,k,e,d)")) {
        final pack = getPack(scriptText);
        final p = pack['p'];
        final a = pack['a'];
        final c = pack['c'];
        final k = List<String>.from(pack['k']);
        final deobfuscated = jsObfuscationReplacer(p, a, c, k);
        final streamUrl = jsonDecode(deobfuscated
            .split("var links=")[1]
            .split(";jwplayer")[0]
            .trim()
            .toString());
        for (var entry in streamUrl.entries) {
          final value = entry.value;
          if (value is List) {
            for (var item in value) {
              if (item.toString().startsWith("http")) {
                final videoUrl = item.toString();
                if (videoUrl.isNotEmpty) {
                  return videoUrl;
                }
              }
            }
          } else if (value.toString().startsWith("http")) {
            final videoUrl = value.toString();
            if (videoUrl.isNotEmpty) {
              return videoUrl;
            }
          }
        }
      }
    }
    return null;
  }

  Future<List<VideoData>> scrape({required StreamSearchData movieData}) async {
    try {
      final streamId = await getStreamId(movieData: movieData);
      if (streamId != null) {
        final url = "$baseUrl$streamId";
        final response = await dio.get(
          url,
          options: Options(
            headers: headers,
          ),
        );

        final source = extractVideoSource(response.data);
        if (source != null &&
            !videoDataList.any((element) => element.videoSourceUrl == source)) {
          videoDataList.add(
            VideoData(
              videoSource: "2EMBED_${videoDataList.length + 1}",
              videoSourceUrl: source,
              videoSourceHeaders: {},
            ),
          );
        } else {
          return videoDataList;
        }
      }
    } catch (e) {
      debugPrint("Error: $e");
    }

    return videoDataList;
  }
}

@riverpod
Future<List<VideoData>> twoEmbedStream(
  ref, {
  required StreamSearchData movieData,
}) {
  try {
    return TwoEmbed().scrape(movieData: movieData);
  } catch (e) {
    return Future.value([]);
  }
}
