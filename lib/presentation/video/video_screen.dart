import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streamora/data/stream.dart';
import 'package:streamora/data/subtitles.dart';
import 'package:streamora/model/subtitle_data.dart';
import 'package:streamora_provider/data/video_data.dart';
import 'package:better_player_remastered/better_player_remastered.dart';

class VideoScreen extends ConsumerStatefulWidget {
  final String backdrop;
  final String tmdbId;
  final String imdbId;
  final String title;
  final String year;
  final String mediaType;
  final int? season;
  final int? episode;

  const VideoScreen({
    super.key,
    required this.backdrop,
    required this.tmdbId,
    required this.imdbId,
    required this.title,
    required this.year,
    required this.mediaType,
    required this.season,
    required this.episode,
  });

  @override
  ConsumerState<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends ConsumerState<VideoScreen> {
  BetterPlayerController? _videoPlayerController;
  late List<VideoData> _videoDataList = [];
  late List<SubtitleData> _subtitleDataList = [];
  late String nowPlayingUrl = "";
  late Map<String, String> nowPlayingHeaders = {};

  Future<void> getStreams() async {
    List<VideoData> videoList = await ref.read(getStreamProvider(
      tmdbId: widget.tmdbId,
      imdbId: widget.imdbId,
      title: widget.title,
      year: widget.year,
      mediaType: widget.mediaType,
      season: widget.season,
      episode: widget.episode,
    ).future);

    if (!mounted) return;

    if (videoList.isNotEmpty) {
      setState(() {
        _videoDataList = videoList;
      });

      changeVideo(
        videoSourceUrl: videoList[0].videoSourceUrl,
        videoSourceHeaders:
            Map<String, String>.from(videoList[0].videoSourceHeaders ?? {}),
        subtitles: _subtitleDataList,
      );
    } else {
      if (!mounted) return;
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          content: Text(
            "We couldn't find any streams for this video.",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onErrorContainer,
                ),
          ),
          showCloseIcon: true,
          closeIconColor: Theme.of(context).colorScheme.onErrorContainer,
          dismissDirection: DismissDirection.horizontal,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 5),
        ),
      );
    }
  }

  Future<void> getSubtitles() async {
    List<SubtitleData> subtitleList = await ref.read(subtitlesProvider(
      tmdbId: widget.imdbId,
      season: widget.season.toString(),
      episode: widget.episode.toString(),
    ).future);

    if (!mounted) return;

    if (subtitleList.isNotEmpty) {
      setState(() {
        _subtitleDataList = subtitleList;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  bool isHLS(String url) {
    print("URL: $url");
    if (url.toLowerCase().contains('.m3u8') ||
        url.toLowerCase().contains('.m3u') ||
        url.toLowerCase().contains('.ts')) {
      return true;
    } else {
      return false;
    }
  }

  void showServerList() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Select Server"),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: _videoDataList.map((value) {
                return ListTile(
                  leading: Icon(
                    Icons.play_arrow,
                    color: value.videoSourceUrl == nowPlayingUrl
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                  title: Text(
                    value.videoSource,
                    style: TextStyle(
                      color: value.videoSourceUrl == nowPlayingUrl
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  onTap: () {
                    changeVideo(
                      videoSourceUrl: value.videoSourceUrl,
                      videoSourceHeaders: Map<String, String>.from(
                          value.videoSourceHeaders ?? {}),
                    );
                    Navigator.pop(context);
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  void changeVideo({
    String? videoSourceUrl,
    Map<String, String>? videoSourceHeaders,
    List<SubtitleData>? subtitles,
  }) {
    if (videoSourceUrl == null) return;
    final isHlsFormat = isHLS(videoSourceUrl);

    List<BetterPlayerSubtitlesSource> subtitleSources = [];
    if (subtitles != null) {
      for (var subtitle in subtitles) {
        subtitleSources.add(
          BetterPlayerSubtitlesSource(
            name: subtitle.subtitleLanguage,
            type: BetterPlayerSubtitlesSourceType.network,
            selectedByDefault:
                subtitle.subtitleLanguage == "English" ? true : false,
            urls: [subtitle.subtitleUrl],
          ),
        );
      }
    }

    final newDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      videoSourceUrl,
      videoFormat: isHlsFormat
          ? BetterPlayerVideoFormat.hls
          : BetterPlayerVideoFormat.other,
      headers: videoSourceHeaders,
      subtitles: subtitleSources,
      liveStream: false,
      notificationConfiguration: BetterPlayerNotificationConfiguration(
          showNotification: true,
          title: "${widget.title} (${widget.year})",
          author: (widget.season != null && widget.episode != null)
              ? "Season ${widget.season} Episode ${widget.episode}"
              : null,
          imageUrl: widget.backdrop,
          activityName: "MainActivity"),
    );

    if (_videoPlayerController != null) {
      _videoPlayerController!.setupDataSource(newDataSource);
    } else {
      _videoPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          fullScreenByDefault: true,
          aspectRatio: 16 / 9,
          autoPlay: true,
          fit: BoxFit.contain,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            title: "${widget.title} (${widget.year})",
            showControls: true,
            playerTheme: BetterPlayerTheme.material,
            enableOverflowMenu: true,
            enableQualities: true,
            enableAudioTracks: true,
            enableSubtitles: true,
            enablePip: true,
            enableProgressBarDrag: true,
            enableSkips: true,
            enableMute: true,
            enableFullscreen: true,
            enablePlayPause: true,
            enableProgressText: true,
            enablePlaybackSpeed: true,
            enableProgressBar: true,
            enableRetry: true,
            overflowMenuCustomItems: [
              BetterPlayerOverflowMenuItem(
                Icons.source,
                "Change Server/Language",
                () {
                  showServerList();
                },
              ),
            ],
          ),
          subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
            fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize!,
            fontColor: Colors.white,
            backgroundColor: Colors.black,
          ),
        ),
        betterPlayerDataSource: newDataSource,
      );
    }

    setState(() {
      nowPlayingUrl = videoSourceUrl;
      nowPlayingHeaders = videoSourceHeaders ?? {};
    });
  }

  @override
  void initState() {
    super.initState();
    getSubtitles().then((value) {
      if (mounted) {
        setState(() {});
      }
    });
    getStreams().then((value) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.title} (${widget.year})",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: _videoDataList.isNotEmpty && _videoPlayerController != null
              ? Center(
                  child: AspectRatio(
                    aspectRatio: 9 / 16,
                    child: BetterPlayer(controller: _videoPlayerController!),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Please wait...\nWe're gathering the streams from Internet.\nIf it takes too long, please try again.\nYou might have slow network.",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
        ),
      ),
      floatingActionButton:
          _videoDataList.isNotEmpty && _videoPlayerController != null
              ? FloatingActionButton(
                  onPressed: () {
                    showServerList();
                  },
                  child: const Icon(Icons.dns),
                )
              : null,
    );
  }
}
