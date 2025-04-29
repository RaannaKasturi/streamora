import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/model/movie_list_data.dart';
import 'package:streamora/presentation/movie/movie_screen.dart';
import 'package:streamora/presentation/series/series_screen.dart';

class CardListCarousel extends StatelessWidget {
  final List<MovieListData> movieData;
  final bool isReleased;
  const CardListCarousel({
    super.key,
    required this.isReleased,
    required this.movieData,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: movieData.map(
            (movie) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8.0,
                ),
                child: InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceContainer,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha((0.1 * 255).toInt()),
                        width: 1,
                      ),
                    ),
                    width: 150,
                    height: 290,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 225,
                          width: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(movie.poster),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            right: 8.0,
                          ),
                          height: 45,
                          child: Text(
                            "${movie.title} (${movie.releaseYear})",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    if (isReleased) {
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
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "This is a ${movie.mediaType == "movie" ? "Movie" : "Series"} is not released yet.",
                          ),
                        ),
                      );
                    }
                  },
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
