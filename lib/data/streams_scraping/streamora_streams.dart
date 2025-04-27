import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/core/common/util.dart';
import 'package:streamora/data/streams_scraping/provider/auto_embed.dart';
import 'package:streamora/data/streams_scraping/provider/netfree.dart';
import 'package:streamora/data/streams_scraping/provider/two_embed.dart';
import 'package:streamora/data/streams_scraping/provider/vidsrc_su.dart';
import 'package:streamora/data/streams_scraping/provider/vidzee.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/video_data.dart';

part 'streamora_streams.g.dart';

class StreamoraStreams {
  final Map<int, dynamic> providers = {
    1: AutoEmbed(),
    2: TwoEmbed(),
    3: VidsrcSu(),
    4: Vidzee(),
    5: NetFree(),
  };

  Future<List<VideoData>> scrape({
    required ScrapeStreamsData movieData,
    required BuildContext context,
  }) async {
    List<VideoData> videoDataList = [];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    });
    for (var index in providers.keys) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      });
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              showCloseIcon: true,
              closeIconColor: Colors.white,
              content: Text(
                "Searching $index of ${providers.length} Providers. Provider: ${providers[index].runtimeType}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      );
      try {
        List<VideoData> streams =
            await providers[index].scrape(movieData: movieData);
        for (VideoData stream in streams) {
          if (await isAccessible(
            url: stream.videoSourceUrl,
            headers: stream.videoSourceHeaders,
          )) {
            videoDataList.add(stream);
          } else {
            continue;
          }
        }
      } catch (e) {
        continue;
      }
      index++;
    }
    return videoDataList;
  }
}

@riverpod
Future<List<VideoData>> streamoraStreams(
  ref, {
  required ScrapeStreamsData movieData,
  required BuildContext context,
}) async {
  return await StreamoraStreams()
      .scrape(movieData: movieData, context: context);
}

// void main() async {
//   final provider = StreamoraStreams();
//   final movieData = ScrapeStreamsData(
//     title: "Dhoom Dhaam",
//     imdbId: "tt14401230",
//     tmdbId: "822119",
//     mediaType: "movie",
//     year: "2025",
//   );
//   List<VideoData> streams = await provider.scrape(movieData: movieData);
//   for (var stream in streams) {
//     print(
//       "Stream: ${stream.videoSource} - ${stream.videoSourceUrl}\n${stream.videoSourceHeaders}",
//     );
//   }
// }
