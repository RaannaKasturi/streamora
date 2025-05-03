import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/model/movie_list_data.dart';
import 'package:streamora/presentation/movie/movie_screen.dart';
import 'package:streamora/presentation/series/series_screen.dart';

class MovieTVGrid extends StatelessWidget {
  const MovieTVGrid({
    super.key,
    required this.sectionTitle,
    required this.nowPlayingMovies,
  });

  final String sectionTitle;
  final AsyncValue<List<MovieListData>> nowPlayingMovies;

  @override
  Widget build(BuildContext context) {
    return nowPlayingMovies.when(
      error: (error, stackTrace) => SizedBox(
        height: 250,
        width: double.infinity,
        child: Center(
          child: Text(
            "Error: $error",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
      loading: () => const SizedBox(
        height: 250,
        width: double.infinity,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
      data: (data) {
        return GridView.builder(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 48,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.6,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final movie = data[index];
            return InkWell(
              onTap: () {
                if (movie.mediaType == "movie") {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: MovieScreen(
                        movieId: movie.id,
                        movieTitle: movie.title,
                      ),
                    ),
                  );
                } else if (movie.mediaType == "tv") {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: SeriesScreen(
                        seriesId: movie.id,
                        seriesTitle: movie.title,
                      ),
                    ),
                  );
                } else {
                  debugPrint("Unknown media type: ${movie.mediaType}");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Unknown media type: ${movie.mediaType}\n${movie.title} (${movie.releaseYear})",
                      ),
                    ),
                  );
                }
              },
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(8)),
                      child: CachedNetworkImage(
                        imageUrl: movie.poster,
                        height: 225,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${movie.title} (${movie.releaseYear})",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
