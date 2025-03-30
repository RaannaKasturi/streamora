import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streamora/data/tmdb.dart';
import 'package:streamora/presentation/home/hero_carousel.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(trendingMoviesProvider);
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final logo = brightness == Brightness.light
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
                // TODO: Handle settings action
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          HeroCarousel(movies: movies),
        ],
      ),
    );
  }
}
