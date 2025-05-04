import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/data/tmdb_provider/movie_details.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/presentation/components/card_list_carousel.dart';
import 'package:streamora/presentation/components/credits_list_carousel.dart';
import 'package:streamora/presentation/components/streamora_error_widget.dart';
import 'package:streamora/presentation/components/streamora_loading_widget.dart';
import 'package:streamora/presentation/search/search_screen.dart';
import 'package:streamora/presentation/searching_streams/searching_streams_screen.dart';

class MovieScreen extends ConsumerWidget {
  final int movieId;
  final String movieTitle;
  const MovieScreen({
    super.key,
    required this.movieId,
    required this.movieTitle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieDetails = ref.watch(movieDetailsProvider(movieId));

    return Scaffold(
      appBar: (movieTitle == "")
          ? AppBar(
              title: movieDetails.when(
                data: (data) => Text(
                  data.title,
                ),
                error: (error, stackTrace) {
                  return const Text("Error Loading Movie");
                },
                loading: () {
                  return const Text("Loading Movie...");
                },
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
            )
          : AppBar(
              title: Text(movieTitle),
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
                height: 10,
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Watch Trailer",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      icon: Icon(Icons.play_arrow),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: SearchingStreamsScreen(
                              backdrop: data.backdrop,
                              movieData: StreamSearchData(
                                title: data.title,
                                imdbId: data.imdbId.toString(),
                                tmdbId: data.id.toString(),
                                mediaType: "movie",
                                year: data.releaseYear,
                                season: null,
                                episode: null,
                              ),
                            ),
                          ),
                        );
                      },
                      label: Text(
                        "Watch Movie",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      icon: Icon(Icons.play_arrow),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 20.0),
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
                      child: InkWell(
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
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: SearchingStreamsScreen(
                                backdrop: data.backdrop,
                                isWatching: false,
                                movieData: StreamSearchData(
                                  title: data.title,
                                  imdbId: data.imdbId.toString(),
                                  tmdbId: data.id.toString(),
                                  mediaType: "movie",
                                  year: data.releaseYear,
                                  season: null,
                                  episode: null,
                                ),
                              ),
                            ),
                          );
                        },
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
          error: (error, stackTrace) {
            debugPrint("Movie Error: $error");
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: const StreamoraErrorWidget(),
            );
          },
          loading: () {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: StreamoraLoadingWidget(),
            );
          },
        ),
      ),
    );
  }
}
