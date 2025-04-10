import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/data/tmdb.dart';
import 'package:streamora/data/user_preferences.dart';
import 'package:streamora/presentation/home/hero_carousel.dart';
import 'package:streamora/presentation/home/in_theatres_near_you.dart';
import 'package:streamora/presentation/home/series_airing_today.dart';
import 'package:streamora/presentation/home/top_rated_movies.dart';
import 'package:streamora/presentation/home/top_rated_series.dart';
import 'package:streamora/presentation/home/upcoming_movies.dart';
import 'package:streamora/presentation/search/search_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final trendingMovies = ref.watch(trendingMoviesProvider);
    final seriesAiringToday = ref.watch(seriesAiringTodayProvider);
    final topRatedMovies = ref.watch(topratedMoviesProvider);
    final topRatedSeries = ref.watch(topratedSeriesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final logo = ref.watch(userPreferencesProvider).value?.theme == "dark"
        ? 'assets/brand/logo_light.png'
        : 'assets/brand/logo_dark.png';
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Image.asset(
              logo,
              height: 32,
            ),
            const SizedBox(width: 8),
            const Text('S T R E A M O R A'),
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeroCarousel(movies: trendingMovies),
            InTheatresNearYou(nowPlayingMovies: nowPlayingMovies),
            SizedBox(
              height: 10,
            ),
            SeriesAiringToday(seriesAiringToday: seriesAiringToday),
            SizedBox(
              height: 10,
            ),
            TopRatedMovies(topRatedMovies: topRatedMovies),
            SizedBox(
              height: 10,
            ),
            TopRatedSeries(topRatedSeries: topRatedSeries),
            SizedBox(
              height: 10,
            ),
            UpcomingMovies(upcomingMovies: upcomingMovies),
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
