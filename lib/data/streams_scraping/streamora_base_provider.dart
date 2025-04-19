import 'package:streamora/core/common/util.dart';
import 'package:streamora/data/streams_scraping/provider/netfree.dart';
import 'package:streamora/data/streams_scraping/provider/two_embed.dart';
import 'package:streamora/data/streams_scraping/provider/vidsrc_su.dart';
import 'package:streamora/data/streams_scraping/provider/vidzee.dart';
import 'package:streamora/model/video_data.dart';

class StreamoraProvider {
  final List providers = [
    TwoEmbed(),
    VidsrcSu(),
    Vidzee(),
    NetFree(),
  ];

  Future<List<VideoData>> scrape({
    required String imdbId,
    required String tmdbId,
    required String mediaType,
    required String title,
    required String year,
    int? season,
    int? episode,
  }) async {
    List<VideoData> videoDataList = [];
    for (var provider in providers) {
      print('Scraping with provider: ${provider.runtimeType}');
      List<VideoData> streams = await provider.scrape(
        imdbId: imdbId,
        tmdbId: tmdbId,
        mediaType: mediaType,
        title: title,
        year: year,
        season: season,
        episode: episode,
      );
      for (VideoData stream in streams) {
        if (await isAccessible(
          url: stream.videoSourceUrl,
          headers: stream.videoSourceHeaders,
        )) {
          videoDataList.add(stream);
        } else {
          print("Streamora: ${stream.videoSource} is not accessible.");
        }
      }
    }
    return videoDataList;
  }
}
