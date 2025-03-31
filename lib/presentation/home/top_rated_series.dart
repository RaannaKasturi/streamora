import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/model/movie_list_data.dart';
import 'package:streamora/presentation/components/card_list_carousel.dart';

class TopRatedSeries extends StatelessWidget {
  const TopRatedSeries({
    super.key,
    required this.topRatedSeries,
  });

  final AsyncValue<List<MovieListData>> topRatedSeries;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Top Rated Series...",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          topRatedSeries.when(
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
              return CardListCarousel(
                movieData: data,
              );
            },
          ),
        ],
      ),
    );
  }
}
