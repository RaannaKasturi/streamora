import 'package:better_player_remastered/better_player_remastered.dart';
import 'package:flutter/material.dart';

class TestVodScreen extends StatefulWidget {
  const TestVodScreen({super.key});

  @override
  State<TestVodScreen> createState() => _TestVodScreenState();
}

class _TestVodScreenState extends State<TestVodScreen> {
  late BetterPlayerController controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    controller = BetterPlayerController(
      BetterPlayerConfiguration(
        fullScreenByDefault: true,
        aspectRatio: 16 / 9,
        autoPlay: true,
        fit: BoxFit.contain,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          title: "widget.title ({widget.year})", // Placeholder string?
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
        ),
        subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
          fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize!,
          fontColor: Colors.white,
          backgroundColor: Colors.black,
        ),
      ),
      betterPlayerDataSource: BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://g9uxp3w0zlkrt4su.orbitproxy.cc/eyJ1IjoiaHR0cHM6Ly9jZG4tMy5vbmlvbmZsaXhlci5jb20vZHQwV1loM1o0Skp6RTVvNXBwT3RCMXNyRHh6Ri1EVVpDNlYzUm9LVE53UnMwMW9kdThFQzVaWlRzYlJHa1dscjVUWVJkWmJYYnJsLVpBa2pQQlBjNXcvRE4zS3FoR0dqTWx2TkQ0VnlhV1o5cElDQkRDdC1lWDZlOGowemJFMUZJay92aWRlby5tM3U4P3Rva2VuPUxYanZESklnVjRIN1ZOMW82WUdnamZyUUR2cTJjcVBPS1gxZ0hxM3E3SU0iLCJvIjoiaHR0cHM6Ly9vbmlvbmZsaXhlci5jb20iLCJyIjoiaHR0cHM6Ly9vbmlvbmZsaXhlci5jb20vIiwiaCI6ImI3MjZhOGMxIn0.m3u8",
        headers: {
          "Referer": "https://vidsrc.su/",
        },
        videoFormat: BetterPlayerVideoFormat.hls,
        liveStream: false,
        notificationConfiguration: BetterPlayerNotificationConfiguration(
          showNotification: true,
          title: "{widget.title} ({widget.year})",
          imageUrl:
              "https://www.gstatic.com/aistudio/welcome/inspiration_video_qa.png",
          activityName: "MainActivity",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayer(controller: controller),
        ),
      ),
    );
  }
}
