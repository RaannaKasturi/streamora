import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streamora/data/supreme_video_data.dart';

class VideoScreen extends ConsumerWidget {
  final String tmdbId;
  final String title;
  final String year;
  final String mediaType;
  final String season;
  final String episode;
  const VideoScreen({
    super.key,
    required this.tmdbId,
    required this.title,
    required this.year,
    required this.mediaType,
    required this.season,
    required this.episode,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoDataListAsync = ref.watch(
      supremeVideoDataProvider(
        tmdbId: tmdbId,
        title: title,
        year: year,
        mediaType: mediaType,
        season: season,
        episode: episode,
      ),
    );

    return Scaffold(
      body: videoDataListAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(child: Text('Error: $error')),
        data: (videoDataList) {
          return ListView.builder(
            itemCount: videoDataList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(videoDataList[index].videoSource),
                subtitle: Text(videoDataList[index].videoSourceUrl),
              );
            },
          );
        },
      ),
    );
  }
}
