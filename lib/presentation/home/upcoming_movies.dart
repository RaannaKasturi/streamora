import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:streamora/model/movie_list_data.dart';
import 'package:streamora/presentation/components/card_list_carousel.dart';
import 'package:streamora/presentation/components/streamora_error_widget.dart';
import 'package:streamora/presentation/components/streamora_loading_widget.dart';

class UpcomingMoviesWidget extends StatelessWidget {
  const UpcomingMoviesWidget({
    super.key,
    required this.upcomingMovies,
  });

  final AsyncValue<List<MovieListData>> upcomingMovies;

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
              "Upcoming Movies...",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          upcomingMovies.when(
            error: (error, stackTrace) {
              debugPrint("Upcoming Movies Error: $error");
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: StreamoraErrorWidget(),
              );
            },
            loading: () {
              return AspectRatio(
                aspectRatio: 16 / 9,
                child: StreamoraLoadingWidget(),
              );
            },
            data: (data) {
              return CardListCarousel(
                movieData: data,
                isReleased: false,
              );
            },
          ),
        ],
      ),
    );
  }
}
