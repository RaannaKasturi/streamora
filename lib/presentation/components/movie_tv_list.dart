import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/model/movie_list_data.dart';
import 'package:streamora/presentation/movie/movie_screen.dart';
import 'package:streamora/presentation/series/series_screen.dart';

class MovieTVList extends StatelessWidget {
  const MovieTVList({
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
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(
                left: 16,
                right: 16,
              ),
              child: InkWell(
                child: Row(
                  spacing: 8,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Stack(
                        children: [
                          AspectRatio(
                            aspectRatio: 9 / 15,
                            child: CachedNetworkImage(
                                imageUrl: data[index].poster),
                          ),
                          Positioned(
                            top: 15,
                            right: 5,
                            child: Badge(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              textColor:
                                  Theme.of(context).colorScheme.onPrimary,
                              label: Text(
                                data[index].mediaType.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 4,
                        children: [
                          Text(
                            "${data[index].title} (${data[index].releaseYear})",
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            data[index].overview,
                            maxLines: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  if (data[index].mediaType == "movie") {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: MovieScreen(
                          movieId: data[index].id,
                          movieTitle: data[index].title,
                        ),
                      ),
                    );
                  } else if (data[index].mediaType == "tv") {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: SeriesScreen(
                          seriesId: data[index].id,
                          seriesTitle: data[index].title,
                        ),
                      ),
                    );
                  } else {
                    debugPrint("Unknown media type: ${data[index].mediaType}");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Unknown media type: ${data[index].mediaType}\n${data[index].title} (${data[index].releaseYear})",
                        ),
                      ),
                    );
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}
