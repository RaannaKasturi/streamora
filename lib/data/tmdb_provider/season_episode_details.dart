import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/data/tmdb_provider/tmdb.dart';
import 'package:streamora/model/episode_details_data.dart';

part 'season_episode_details.g.dart';

class SeasonEpisodeDetails {
  final Tmdb tmdb = Tmdb();
  late final String baseTMDBEndpoint;
  late final Dio dio;
  late final Map<String, dynamic> headers;

  SeasonEpisodeDetails() {
    baseTMDBEndpoint = tmdb.baseTMDBEndpoint;
    dio = tmdb.dio;
    headers = tmdb.headers;
  }

  Future<List<EpisodeDetailsData>> getSeasonEpisodesDetails(
      {required int seriesID, required int seasonNumber}) async {
    final response = await dio.get(
      "$baseTMDBEndpoint/tv/$seriesID/season/$seasonNumber",
      options: Options(headers: headers),
    );
    final moviesData = response.data as Map<String, dynamic>;
    final List<EpisodeDetailsData> episodes =
        (moviesData['episodes'] as List<dynamic>)
            .map<EpisodeDetailsData>((episode) {
      return EpisodeDetailsData(
        episodeTitle: episode['name'],
        stillPath: episode['still_path'] != null
            ? "https://image.tmdb.org/t/p/w500${episode['still_path']}"
            : "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/backdrop_placeholder.png",
        seasonNumber: episode['season_number'].toString(),
        episodeNumber: episode['episode_number'].toString(),
        airDate: episode['air_date'],
        runTime: episode['runtime'] != null
            ? "${(episode['runtime'] ~/ 60).floor()}h ${(episode['runtime'] % 60)}m"
            : "N/A",
        overview: episode['overview'] ?? "No overview available",
      );
    }).toList();
    return episodes;
  }
}

@Riverpod(keepAlive: true)
class SeasonEpisodes extends _$SeasonEpisodes {
  SeasonEpisodeDetails get seasonEpisodeDetails => SeasonEpisodeDetails();

  @override
  Future<List<EpisodeDetailsData>> build(
      int seriesID, int initialSeason) async {
    return await seasonEpisodeDetails.getSeasonEpisodesDetails(
      seriesID: seriesID,
      seasonNumber: initialSeason,
    );
  }

  Future<void> getSeasonEpisodes(int seasonNumber) async {
    state = const AsyncValue.loading();
    try {
      final episodes = await seasonEpisodeDetails.getSeasonEpisodesDetails(
        seriesID: seriesID,
        seasonNumber: seasonNumber,
      );
      state = AsyncValue.data(episodes);
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
    }
  }
}
