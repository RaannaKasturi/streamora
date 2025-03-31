import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieScreen extends ConsumerWidget {
  final int movieId;
  const MovieScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie Details"),
      ),
      body: Center(
        child: Text(
          "Movie ID: $movieId",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
