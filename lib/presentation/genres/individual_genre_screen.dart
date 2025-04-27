import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/core/common/util.dart';
import 'package:streamora/data/tmdb.dart';
import 'package:streamora/presentation/components/movie_tv_carousel.dart';
import 'package:streamora/presentation/search/search_screen.dart';

class IndividualGenreScreen extends ConsumerWidget {
  final String genreName;
  final String genreId;
  final String mediaType;
  const IndividualGenreScreen({
    required this.genreName,
    required this.genreId,
    required this.mediaType,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesByGenre = ref.watch(
      getMoviesSeriesByGenreProvider(genreId: genreId, mediaType: mediaType),
    );
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Image.asset(
              getLogo(ref),
              height: 32,
            ),
            const SizedBox(width: 8),
            Text(
              genreName.toUpperCase().splitMapJoin("",
                  onMatch: (m) => " ", onNonMatch: (n) => n.toUpperCase()),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
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
      body: MovieTVCarousel(
        nowPlayingMovies: moviesByGenre,
        sectionTitle: '',
      ),
    );
  }
}
