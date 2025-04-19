import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streamora/data/subtitles.dart';
import 'package:streamora/model/subtitle_data.dart';
import 'package:streamora/model/video_data.dart';
import 'package:better_player_plus/better_player_plus.dart';

class TestVodScreen extends ConsumerStatefulWidget {
  const TestVodScreen({
    super.key,
  });

  @override
  ConsumerState<TestVodScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends ConsumerState<TestVodScreen> {
  BetterPlayerController? _videoPlayerController;
  late List<VideoData> _videoDataList = [];
  late List<SubtitleData> _subtitleDataList = [];
  late String nowPlayingUrl = "";
  late Map<String, String> nowPlayingHeaders = {};
  bool _initialized = false;
  bool isLoading = true;
  final GlobalKey betterPlayerKey = GlobalKey();

  Future<void> getStreams() async {
    List<VideoData> videoList = [
      VideoData(
        videoSource: 'Test Video',
        videoSourceUrl: 'https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8',
        videoSourceHeaders: {},
      ),
      VideoData(
        videoSource: 'AUTOEMBED1_1',
        videoSourceUrl: 'https://s4.phim1280.tv/20250218/3In5bvui/index.m3u8',
        videoSourceHeaders: {},
      ),
      VideoData(
        videoSource: 'EMBED_1 (1080)',
        videoSourceUrl:
            'https://embed.su/api/proxy/viper/snowflakes77.pro/file1/n32vQu2kTV8hhDb3JLkrdfqjSLxMQ8upG7W11jhGtDoHjriOiKMvS30YjIFIdv5aFgnJibm3d+UYL6O~04ju9xRZLIDm9QSVd~pkIqbhHClumW8FPLzc72pcb5JG+x87tUKegIZlSGG7t682Y4+NKn~GlUXKXHljKHDaD3QzoY4=/MTA4MA==/aW5kZXgubTN1OA==.m3u8',
        videoSourceHeaders: {
          'Referer': 'https://embed.su',
          'Origin': 'https://embed.su'
        },
      ),
      VideoData(
        videoSource: 'EMBED_2 (720)',
        videoSourceUrl:
            'https://embed.su/api/proxy/viper/snowflakes77.pro/file1/n32vQu2kTV8hhDb3JLkrdfqjSLxMQ8upG7W11jhGtDoHjriOiKMvS30YjIFIdv5aFgnJibm3d+UYL6O~04ju9xRZLIDm9QSVd~pkIqbhHClumW8FPLzc72pcb5JG+x87tUKegIZlSGG7t682Y4+NKn~GlUXKXHljKHDaD3QzoY4=/NzIw/aW5kZXgubTN1OA==.m3u8',
        videoSourceHeaders: {
          'Referer': 'https://embed.su',
          'Origin': 'https://embed.su'
        },
      ),
      VideoData(
        videoSource: 'EMBED_3 (360)',
        videoSourceUrl:
            'https://embed.su/api/proxy/viper/snowflakes77.pro/file1/n32vQu2kTV8hhDb3JLkrdfqjSLxMQ8upG7W11jhGtDoHjriOiKMvS30YjIFIdv5aFgnJibm3d+UYL6O~04ju9xRZLIDm9QSVd~pkIqbhHClumW8FPLzc72pcb5JG+x87tUKegIZlSGG7t682Y4+NKn~GlUXKXHljKHDaD3QzoY4=/MzYw/aW5kZXgubTN1OA==.m3u8',
        videoSourceHeaders: {
          'Referer': 'https://embed.su',
          'Origin': 'https://embed.su'
        },
      ),
      VideoData(
        videoSource: 'VIDSRC_1',
        videoSourceUrl:
            'https://g9uxp3w0zlkrt4su.orbitproxy.cc/eyJ1IjoiaHR0cHM6Ly9jZG4tMi5vbmlvbmZsaXhlci5jb20vNTUtUDl1cU1EXzdSRC1lemU2LTcyTlY4dVlkb0FpSjk3TzBtb2E5ZnF2UUEtRDNfbjZWbzNqR25ZS3d1Q0tXN3JJalRtRHowYVBkYkgzdkdlVWY0Q0EvRU53WG9xNWd2R1pZNEpNUkVPbEEwVDBVWm42dnAtQ2FzUEJpcGJia2dRWS92aWRlby5tM3U4P3Rva2VuPWN4M01hRXV1bkxQNUlDQUtxWE9XbVE2dkFsTEhISUZEeWY4ajFvLW1Ed2ciLCJvIjoiaHR0cHM6Ly9vbmlvbmZsaXhlci5jb20iLCJyIjoiaHR0cHM6Ly9vbmlvbmZsaXhlci5jb20vIiwiaCI6IjVlMzcwNjkxIn0.m3u8',
        videoSourceHeaders: {
          "User-Agent":
              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
          "Referer": "https://vidsrc.su/",
          "Origin": "https://vidsrc.su/"
        },
      ),
      VideoData(
        videoSource: 'VIDSRC_2',
        videoSourceUrl:
            'https://g9uxp3w0zlkrt4su.orbitproxy.cc/eyJ1IjoiaHR0cHM6Ly9tM3U4LndhZmZsZWhhY2tlci5pby9tM3U4LXByb3h5P3VybD0lMkZkbCUzRm9wJTNEZ2V0X3NsaWRlcyUyNmxlbmd0aCUzRDcxMDUlMjZ1cmwlM0RodHRwcyUzQSUyRiUyRmFrdW1hY2hpLmNvbSUyRmYza2gyeGdxa3E2MzAwMDAuanBnIiwibyI6Imh0dHBzOi8vbWVnYWNsb3VkLnN0b3JlIiwiciI6Imh0dHBzOi8vbWVnYWNsb3VkLnN0b3JlLyIsImgiOiI5NzUzZGE1NyJ9.m3u8',
        videoSourceHeaders: {
          'User-Agent':
              "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
          'Referer': 'https://vidsrc.su/',
          'Origin': 'https://vidsrc.su/',
        },
      ),
      VideoData(
        videoSource: 'VIDSRC_3',
        videoSourceUrl:
            'https://cloudburst99.xyz/file2/n32vQu2kTV8hhDb3JLkrdfqjSLxMQ8upG7W11jhGtDoHjriOiKMvS30YjIFIdv5aFgnJibm3d+UYL6O~04ju9xRZLIDm9QSVd~pkIqbhHClumW8FPLzc72pcb5JG+x87tUKegIZlSGG7t682Y4+NKn~GlUXKXHljKHDaD3QzoY4=/cGxheWxpc3QubTN1OA==.m3u8',
        videoSourceHeaders: {},
      ),
      VideoData(
        videoSource: '2EMBED_1',
        videoSourceUrl:
            'https://a9jkzk10gy.cdn-centaurus.com/hls2/01/09548/mnpkev7613sg_n/master.m3u8?t=e7Jfrdo4qjd_tUuM4mMp7XjJqpuKCpTVprlZSGHcLik&s=1744976832&e=129600&f=47769808&srv=FRdn5eAUPJ&i=0.4&sp=500&p1=FRdn5eAUPJ&p2=FRdn5eAUPJ&asn=24554',
        videoSourceHeaders: {'Referer': 'https://megacloud.store/'},
      ),
      VideoData(
        videoSource: 'VIDZEE_1 (Hindi)',
        videoSourceUrl:
            'https://i-cdn-0.denni348sof.com/stream2/i-cdn-0/f476308a5fa351edf2d8b28dce98e07a/MJTMsp1RshGTygnMNRUR2N2MSlnWXZEdMNDZzQWe5MDZzMmdZJTO1R2RWVHZDljekhkSsl1VwYnWtx2cihVT21keW1WWt1EeORUTw0kaZdXTX50aZdVVyoVbRhnWUhGaNREbs1kaFpXW6dWP:1744977788:195.182.25.53:68fddbbef24c563bee78d022f69cf23e406fb8fff5a918d1cf175748e235cfee/index.m3u8',
        videoSourceHeaders: {},
      ),
      VideoData(
        videoSource: 'VIDZEE_2 (English)',
        videoSourceUrl:
            'https://i-cdn-0.denni348sof.com/stream2/i-cdn-0/f476308a5fa351edf2d8b28dce98e07a/MJTMsp1RshGTygnMNRUR2N2MSlnWXZEdMNDZzQWe5MDZzMmdZJTO1R2RWVHZDljekhkSsl1VwYnWtx2cihVT2p1VFBTWXpUbaR1ZyklejdXTEVEeNRlUqpVba12TEhmaNRVR04keSp2TE1UP:1744977788:195.182.25.53:b3a92e9a211202092440f96735411b5ea9d26127bec397eaa9654ce1034d701d/index.m3u8',
        videoSourceHeaders: {},
      ),
      VideoData(
        videoSource: 'VIDZEE_3 (Bengali)',
        videoSourceUrl:
            'https://i-cdn-0.denni348sof.com/stream2/i-cdn-0/f476308a5fa351edf2d8b28dce98e07a/MJTMsp1RshGTygnMNRUR2N2MSlnWXZEdMNDZzQWe5MDZzMmdZJTO1R2RWVHZDljekhkSsl1VwYnWtx2cihVT21EVNRTTyolaPR1Y6pFRrpXWUF1dN1mUo1keVlnTH1UMPRlUtlVbGhWWqdWP:1744977788:195.182.25.53:bcf2855aed3064f6b09fbcb99b95208f0a4a642f3976ea48f321950520e8cffb/index.m3u8',
        videoSourceHeaders: {},
      ),
      VideoData(
        videoSource: 'VIDZEE_4 (Tamil)',
        videoSourceUrl:
            'https://i-cdn-0.denni348sof.com/stream2/i-cdn-0/f476308a5fa351edf2d8b28dce98e07a/MJTMsp1RshGTygnMNRUR2N2MSlnWXZEdMNDZzQWe5MDZzMmdZJTO1R2RWVHZDljekhkSsl1VwYnWtx2cihVT21keWhWTqFVNORkUrpFVFh3TEdWMadVW51EROt2TEJ1aO1mRopFVK1mTt1UP:1744977789:195.182.25.53:8df28a141abcb7056b67cf6ceb55f674e6f241375ed4235d420a00c48f84441c/index.m3u8',
        videoSourceHeaders: {},
      ),
      VideoData(
        videoSource: 'VIDZEE_5 (Telugu)',
        videoSourceUrl:
            'https://i-cdn-0.denni348sof.com/stream2/i-cdn-0/f476308a5fa351edf2d8b28dce98e07a/MJTMsp1RshGTygnMNRUR2N2MSlnWXZEdMNDZzQWe5MDZzMmdZJTO1R2RWVHZDljekhkSsl1VwYnWtx2cihVT29EVa1mWUFUeN1mTo5kakhWTHVlMOp3Zx8EROhmWqp1aOdVRz4EVShWTU1UP:1744977789:195.182.25.53:01574a7fe12ca01ff39bf32687f043b873351c829e137628e9d5fca6a6a3d940/index.m3u8',
        videoSourceHeaders: {},
      ),
      VideoData(
        videoSource: 'NETFREE_1 (Auto) Multi-Lang',
        videoSourceUrl:
            'https://netfree2.cc/mobile/hls/81943001.m3u8?in=1be0e04efe166ce9d9ee9a45b1581944::617d71bf1d45c348e0256e51f07ad8bd::1744976838::ni',
        videoSourceHeaders: {},
      ),
      VideoData(
        videoSource: 'NETFREE_2 (Mid HD) Multi-Lang',
        videoSourceUrl:
            'https://netfree2.cc/mobile/hls/81943001.m3u8?q=720p&in=1be0e04efe166ce9d9ee9a45b1581944::617d71bf1d45c348e0256e51f07ad8bd::1744976838::ni',
        videoSourceHeaders: {},
      ),
      VideoData(
        videoSource: 'NETFREE_3 (Low HD) Multi-Lang',
        videoSourceUrl:
            'https://netfree2.cc/mobile/hls/81943001.m3u8?q=480p&in=1be0e04efe166ce9d9ee9a45b1581944::617d71bf1d45c348e0256e51f07ad8bd::1744976838::ni',
        videoSourceHeaders: {},
      ),
    ];

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
      tmdbId: "7239223",
      season: "23",
      episode: "2",
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

    if (!_initialized) {
      _initialized = true;
      _initialize();
    }
  }

  Future<void> _initialize() async {
    setState(() => isLoading = true);
    await getSubtitles();
    await getStreams();
    setState(() => isLoading = false);
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
      headers: videoSourceHeaders,
      videoFormat: isHlsFormat
          ? BetterPlayerVideoFormat.hls
          : BetterPlayerVideoFormat.other,
      subtitles: subtitleSources,
      liveStream: false,
      notificationConfiguration: BetterPlayerNotificationConfiguration(
        showNotification: true,
        title: "Testing",
        author: "Streamora",
        imageUrl:
            "https://raw.githubusercontent.com/RaannaKasturi/streamora/refs/heads/master/assets/placeholder/backdrop_placeholder.png",
        activityName: "Video Player",
        notificationChannelName: "Streamora",
      ),
    );

    if (_videoPlayerController != null) {
      _videoPlayerController!.setupDataSource(newDataSource);
      _videoPlayerController!.setBetterPlayerGlobalKey(betterPlayerKey);
    } else {
      _videoPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
          autoPlay: true,
          handleLifecycle: true,
          fit: BoxFit.contain,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            title: "Test Video",
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
          "Test Video",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: isLoading
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          const SizedBox(height: 20),
                          Text(
                            "Please wait...\nWe're gathering the streams from Internet.\nIf it takes too long, please try again.",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      )
                    : _videoPlayerController != null
                        ? AspectRatio(
                            aspectRatio: 9 / 16,
                            child: BetterPlayer(
                              controller: _videoPlayerController!,
                              key: betterPlayerKey,
                            ),
                          )
                        : Text("No stream available."),
              ),
              ElevatedButton(
                child: Text("Show PiP"),
                onPressed: () {
                  _videoPlayerController
                      ?.enablePictureInPicture(betterPlayerKey);
                },
              ),
              ElevatedButton(
                child: Text("Disable PiP"),
                onPressed: () async {
                  _videoPlayerController?.disablePictureInPicture();
                },
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
