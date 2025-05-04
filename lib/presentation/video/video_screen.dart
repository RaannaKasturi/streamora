import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streamora/model/provider_data.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/subtitle_data.dart';
import 'package:streamora/model/video_data.dart';
import 'package:better_player_plus/better_player_plus.dart';

class VideoScreen extends ConsumerStatefulWidget {
  final String backdrop;
  final List<SubtitleData> subtitleDataList;
  final StreamSearchData movieData;
  final List<ProviderData> providerDataList;

  const VideoScreen({
    super.key,
    required this.backdrop,
    required this.subtitleDataList,
    required this.movieData,
    required this.providerDataList,
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
  bool isSearching = true;
  GlobalKey betterPlayerKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  bool isHLS(String url) {
    debugPrint("URL: $url");
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
        List<Widget> childern = _videoDataList.map((value) {
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
                videoSourceHeaders:
                    Map<String, String>.from(value.videoSourceHeaders ?? {}),
                subtitles: _subtitleDataList,
              );
              Navigator.pop(context);
            },
          );
        }).toList();
        return AlertDialog(
          title: const Text("Select Server"),
          content: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                ...[
                  ...childern,
                  isSearching
                      ? ListTile(
                          leading: const CircularProgressIndicator(),
                          title: const Text("Searching Servers..."),
                        )
                      : null,
                ].whereType<Widget>(),
              ],
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

    debugPrint("-" * 25);
    debugPrint("Video Source: $videoSourceUrl");
    debugPrint("Video Source URL: $videoSourceUrl");
    debugPrint("Video Source Headers: $videoSourceHeaders");
    debugPrint("-" * 25);

    List<BetterPlayerSubtitlesSource> subtitleSources = [];
    if (subtitles != null && subtitles.isNotEmpty) {
      for (var subtitle in subtitles) {
        subtitleSources.add(
          BetterPlayerSubtitlesSource(
            name: subtitle.subtitleLanguage,
            type: BetterPlayerSubtitlesSourceType.file,
            selectedByDefault:
                subtitle.subtitleLanguage == "ENGLISH" ? true : false,
            urls: [subtitle.subtitleUrl],
          ),
        );
      }
    }

    final newDataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      videoSourceUrl,
      headers: videoSourceHeaders,
      videoFormat: isHlsFormat
          ? BetterPlayerVideoFormat.hls
          : BetterPlayerVideoFormat.other,
      subtitles: subtitleSources,
      liveStream: false,
      notificationConfiguration: BetterPlayerNotificationConfiguration(
          showNotification: true,
          title: "${widget.movieData.title} (${widget.movieData.year})",
          author: (widget.movieData.season != null &&
                  widget.movieData.episode != null)
              ? "Season ${widget.movieData.season} Episode ${widget.movieData.episode}"
              : null,
          imageUrl: widget.backdrop,
          activityName: "MainActivity"),
    );

    if (_videoPlayerController != null) {
      _videoPlayerController!.setupDataSource(newDataSource);
    } else {
      _videoPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
          autoPlay: true,
          fit: BoxFit.contain,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            title: "${widget.movieData.title} (${widget.movieData.year})",
            showControls: true,
            playerTheme: BetterPlayerTheme.material,
            enableOverflowMenu: true,
            progressBarBufferedColor: Colors.grey,
            progressBarPlayedColor: Theme.of(context).colorScheme.primary,
            progressBarHandleColor: Theme.of(context).colorScheme.primary,
            progressBarBackgroundColor: Colors.white,
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
            leftPadding: 12,
            rightPadding: 12,
            outlineEnabled: true,
            outlineColor: Colors.black,
            outlineSize: 10,
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

  void getAllStreams() async {
    setState(() {
      isSearching = true;
    });
    for (final provider in widget.providerDataList) {
      try {
        final providerInstance =
            provider.providerFunction(movieData: widget.movieData);
        List<VideoData> result = await ref.read(providerInstance.future);
        if (result.isNotEmpty) {
          for (var video in result) {
            if (video.videoSourceUrl != nowPlayingUrl &&
                !_videoDataList.any((element) =>
                    element.videoSourceUrl == video.videoSourceUrl)) {
              _videoDataList.add(video);
            }
          }
          setState(() {
            provider.videoDataList = result;
            provider.streamFound = true;
            provider.isSearching = false;
            _videoDataList = _videoDataList;
          });
        } else {
          setState(() {
            provider.streamFound = false;
            provider.isSearching = false;
          });
        }
      } catch (e) {
        setState(() {
          provider.streamFound = false;
          provider.isSearching = false;
        });
        continue;
      }
    }
    setState(() {
      isSearching = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        behavior: SnackBarBehavior.floating,
        showCloseIcon: true,
        closeIconColor: Theme.of(context).colorScheme.onPrimary,
        content: Text(
          "New ${_videoDataList.length - 1} streams found.",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _videoDataList = widget.providerDataList
        .map((provider) => provider.videoDataList)
        .expand((videoData) => videoData)
        .toList();
    _subtitleDataList = widget.subtitleDataList;
    nowPlayingUrl = _videoDataList[0].videoSourceUrl;
    nowPlayingHeaders =
        Map<String, String>.from(_videoDataList[0].videoSourceHeaders ?? {});
    WidgetsBinding.instance.addPostFrameCallback((_) {
      changeVideo(
        videoSourceUrl: nowPlayingUrl,
        subtitles: _subtitleDataList,
        videoSourceHeaders: nowPlayingHeaders,
      );
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllStreams();
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
          "${widget.movieData.title} (${widget.movieData.year})",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: _videoDataList.isNotEmpty && _videoPlayerController != null
              ? AspectRatio(
                  aspectRatio: 9 / 16,
                  child: BetterPlayer(
                    controller: _videoPlayerController!,
                    key: betterPlayerKey,
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
