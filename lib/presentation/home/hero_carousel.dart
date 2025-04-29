import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/model/movie_list_data.dart';
import 'package:streamora/presentation/components/streamora_error_widget.dart';
import 'package:streamora/presentation/components/streamora_loading_widget.dart';
import 'package:streamora/presentation/movie/movie_screen.dart';
import 'package:streamora/presentation/series/series_screen.dart';

class HeroCarousel extends StatelessWidget {
  const HeroCarousel({
    super.key,
    required this.movies,
  });

  final AsyncValue<List<MovieListData>> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: movies.when(
        loading: () {
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: StreamoraLoadingWidget(),
          );
        },
        error: (error, stackTrace) {
          debugPrint("Hero Carousel Error: $error");
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: StreamoraErrorWidget(),
          );
        },
        data: (moviesList) {
          return AspectRatio(
            aspectRatio: 16 / 12,
            child: CarouselSlider(
              items: moviesList.map<Widget>(
                (movie) {
                  return InkWell(
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(movie.backdrop),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Theme.of(context).colorScheme.surface,
                                Colors.transparent,
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Chip(
                                label: Text(
                                  "⭐ ${movie.voteAverage}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                ),
                              ),
                              Wrap(
                                children: [
                                  for (var genre in movie.genres ?? [])
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Badge(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        label: Text(
                                          genre,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall
                                              ?.copyWith(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                              Text(
                                "${movie.title} (${movie.releaseYear})",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              Text(
                                movie.overview,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Badge(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            label: Text(
                              movie.mediaType == "movie"
                                  ? "Movie"
                                  : movie.mediaType == "tv"
                                      ? "TV Show"
                                      : "Unknown",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                  ),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      if (movie.mediaType == "movie") {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: MovieScreen(
                              movieTitle: movie.title,
                              movieId: movie.id,
                            ),
                          ),
                        );
                      } else if (movie.mediaType == "tv") {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: SeriesScreen(
                              seriesTitle: movie.title,
                              seriesId: movie.id,
                            ),
                          ),
                        );
                      } else {
                        debugPrint("Unknown media type: ${movie.mediaType}");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Unknown media type: ${movie.mediaType} \n${movie.title} (${movie.releaseYear}). Please report this issue.",
                            ),
                          ),
                        );
                      }
                    },
                  );
                },
              ).toList(),
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                viewportFraction: 1,
                aspectRatio: 16 / 9,
                initialPage: 0,
              ),
            ),
          );
        },
      ),
    );
  }
}
