import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streamora/model/hero_carousel.dart';

class HeroCarousel extends StatelessWidget {
  const HeroCarousel({
    super.key,
    required this.movies,
  });

  final AsyncValue<List<HeroCarouselData>> movies;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: movies.when(
        loading: () => const AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        error: (error, stackTrace) => AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
            child: Text(
              "Error: $error",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        data: (moviesList) {
          return AspectRatio(
            aspectRatio: 16 / 12,
            child: CarouselSlider(
              items: moviesList.map<Widget>(
                (movie) {
                  return Stack(
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
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
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
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ],
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
