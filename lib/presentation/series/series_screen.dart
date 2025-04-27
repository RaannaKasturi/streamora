import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/data/tmdb.dart';
import 'package:streamora/model/episode_details_data.dart';
import 'package:streamora/model/series_details_data.dart';
import 'package:streamora/presentation/components/card_list_carousel.dart';
import 'package:streamora/presentation/components/credits_list_carousel.dart';
import 'package:streamora/presentation/search/search_screen.dart';
import 'package:streamora/presentation/video/video_screen.dart';

class SeriesScreen extends ConsumerStatefulWidget {
  final int seriesId;
  const SeriesScreen({super.key, required this.seriesId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SeriesScreenState();
}

class _SeriesScreenState extends ConsumerState<SeriesScreen> {
  int selectedSeason = 1;

  @override
  Widget build(BuildContext context) {
    final AsyncValue<SeriesDetailsData> movieDetails =
        ref.watch(seriesDetailsProvider(widget.seriesId));
    final AsyncValue<List<EpisodeDetailsData>> seriesSeasonEpisodeDetails =
        ref.watch(seasonEpisodesProvider(widget.seriesId, selectedSeason));

    return Scaffold(
      appBar: AppBar(
        title: movieDetails.when(
          data: (data) => Text(data.title),
          error: (error, stack) => const Text('Error'),
          loading: () => const Text('Loading...'),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const SearchScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: movieDetails.when(
          data: (data) => Column(
            children: [
              Image.network(
                data.backdrop,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 15,
              ),
              data.logo.contains("placeholder")
                  ? Text(
                      data.title,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: CachedNetworkImage(
                        imageUrl: data.logo,
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
              data.tagline.isNotEmpty
                  ? Text(
                      data.tagline,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey,
                          ),
                    )
                  : const SizedBox(),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Row(
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data.releaseYear,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Icon(Icons.circle, size: 5),
                    Text(
                      data.runtime,
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Icon(Icons.circle, size: 5),
                    Text(
                      data.originalLanguage.toUpperCase(),
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Icon(Icons.circle, size: 5),
                    Text(
                      "⭐ ${data.voteAverage} (${data.voteCount})",
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Text(
                  data.genres!.join(" | "),
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  data.overview,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha((0.1 * 255).toInt()),
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            const SizedBox(height: 5),
                            Text(
                              "Watchlist",
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha((0.1 * 255).toInt()),
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.share),
                            const SizedBox(height: 5),
                            Text(
                              "Share",
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha((0.1 * 255).toInt()),
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.download),
                            const SizedBox(height: 5),
                            Text(
                              "Download",
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withAlpha((0.1 * 255).toInt()),
                            width: 1,
                          ),
                        ),
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.star),
                            const SizedBox(height: 5),
                            Text(
                              "Rate",
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<int>(
                        menuMaxHeight: 300,
                        decoration: InputDecoration(
                          labelText: "Season",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        items: [
                          for (int i = 1; i <= data.seasonNumber; i++)
                            DropdownMenuItem<int>(
                              value: i,
                              child: Text("Season $i"),
                            ),
                        ],
                        value: 1,
                        onChanged: (value) {
                          setState(() {
                            selectedSeason = value!;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: SizedBox(),
                    )
                  ],
                ),
              ),
              seriesSeasonEpisodeDetails.when(
                data: (seasonEpisodeData) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    alignment: Alignment.topLeft,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: seasonEpisodeData.map((episode) {
                          return InkWell(
                            child: Container(
                              margin: const EdgeInsets.only(
                                right: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurface
                                      .withAlpha((0.1 * 255).toInt()),
                                  width: 1,
                                ),
                              ),
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: Alignment.bottomLeft,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                          ),
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                        child: AspectRatio(
                                          aspectRatio: 16 / 12,
                                          child: CachedNetworkImage(
                                            imageUrl: episode.stillPath,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.center,
                                          ),
                                        ),
                                      ),
                                      Positioned.fill(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Colors.black,
                                                Colors.transparent,
                                              ],
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, bottom: 8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "S${episode.seasonNumber} E${episode.episodeNumber}",
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              episode.episodeTitle,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      episode.overview,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: Colors.grey,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: VideoScreen(
                                    backdrop: data.backdrop,
                                    imdbId: data.imdbId.toString(),
                                    tmdbId: data.id.toString(),
                                    title: data.title,
                                    year: data.releaseYear,
                                    mediaType: "tv",
                                    season: episode.seasonNumber,
                                    episode: episode.episodeNumber,
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  );
                },
                error: (error, stack) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Error: $error',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                loading: () => const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CreditsListCarousel(
                creditsData: data.cast,
                isCast: true,
              ),
              SizedBox(
                height: 15,
              ),
              CreditsListCarousel(
                creditsData: data.crew,
                isCast: false,
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                alignment: Alignment.topLeft,
                child: Text(
                  "Similar Movies",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              CardListCarousel(
                movieData: data.similarMovies,
                isReleased: true,
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
          error: (error, stack) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Error: $error',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          loading: () => const Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ]),
          ),
        ),
      ),
    );
  }
}
