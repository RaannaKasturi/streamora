import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/core/common/util.dart';
import 'package:streamora/data/tmdb_provider/airing_today.dart';
import 'package:streamora/data/tmdb_provider/now_playing_movies.dart';
import 'package:streamora/data/tmdb_provider/top_rated_movies.dart';
import 'package:streamora/data/tmdb_provider/top_rated_series.dart';
import 'package:streamora/data/tmdb_provider/trending_movies.dart';
import 'package:streamora/data/tmdb_provider/upcoming_movies.dart';
import 'package:streamora/presentation/home/hero_carousel.dart';
import 'package:streamora/presentation/home/in_theatres_near_you.dart';
import 'package:streamora/presentation/home/series_airing_today.dart';
import 'package:streamora/presentation/home/top_rated_movies.dart';
import 'package:streamora/presentation/home/top_rated_series.dart';
import 'package:streamora/presentation/home/upcoming_movies.dart';
import 'package:streamora/presentation/search/search_screen.dart';
import 'package:streamora/presentation/video/test_subs.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlayingMovies = ref.watch(nowPlayingProvider);
    final trendingMovies = ref.watch(trendingMoviesProvider);
    final seriesAiringToday = ref.watch(airingTodayProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final topRatedSeries = ref.watch(topRatedSeriesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Image.asset(
                getLogo(ref),
                height: 32,
              ),
              const SizedBox(width: 8),
              const Text('S T R E A M O R A'),
            ],
          ),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const TestSubs(),
              ),
            );
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
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeroCarouselWidget(movies: trendingMovies),
            InTheatresNearYouWidget(nowPlayingMovies: nowPlayingMovies),
            SizedBox(
              height: 10,
            ),
            SeriesAiringTodayWidget(seriesAiringToday: seriesAiringToday),
            SizedBox(
              height: 10,
            ),
            TopRatedMoviesWidget(topRatedMovies: topRatedMovies),
            SizedBox(
              height: 10,
            ),
            TopRatedSeriesWidget(topRatedSeries: topRatedSeries),
            SizedBox(
              height: 10,
            ),
            UpcomingMoviesWidget(upcomingMovies: upcomingMovies),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.5,
              indent: MediaQuery.of(context).size.width * 0.2,
              endIndent: MediaQuery.of(context).size.width * 0.2,
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  spacing: 8,
                  children: [
                    Text(
                      "Made with ❤️ by Nayan Kasturi",
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      "No copyright infringement intended. We don't own any of the content. All content is scrapped from internet.",
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Mail us at streamora@raannakasturi.eu.org for any queries.",
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
