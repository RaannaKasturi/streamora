import 'package:streamora/core/common/util.dart';
import 'package:streamora/data/streams_scraping/provider/auto_embed.dart';
import 'package:streamora/data/streams_scraping/provider/netfree.dart';
import 'package:streamora/data/streams_scraping/provider/two_embed.dart';
import 'package:streamora/data/streams_scraping/provider/vidsrc_su.dart';
import 'package:streamora/data/streams_scraping/provider/vidzee.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/video_data.dart';

class StreamoraProvider {
  final List providers = [
    AutoEmbed(),
    TwoEmbed(),
    VidsrcSu(),
    Vidzee(),
    NetFree(),
  ];

  Future<List<VideoData>> scrape({required ScrapeStreamsData movieData}) async {
    List<VideoData> videoDataList = [];
    for (var provider in providers) {
      try {
        List<VideoData> streams = await provider.scrape(movieData: movieData);
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
        print("Streamora: Error scraping ${provider.runtimeType}: $e");
      }
    }
    return videoDataList;
  }
}

void main() async {
  final provider = StreamoraProvider();
  final movieData = ScrapeStreamsData(
    title: "Dhoom Dhaam",
    imdbId: "tt14401230",
    tmdbId: "822119",
    mediaType: "movie",
    year: "2025",
  );
  List<VideoData> streams = await provider.scrape(movieData: movieData);
  for (var stream in streams) {
    print(
      "Stream: ${stream.videoSource} - ${stream.videoSourceUrl}\n${stream.videoSourceHeaders}",
    );
  }
}
