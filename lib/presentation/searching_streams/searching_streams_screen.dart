import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/data/stream_provider/auto_embed.dart';
import 'package:streamora/data/stream_provider/flixhq.dart';
import 'package:streamora/data/stream_provider/netfree.dart';
import 'package:streamora/data/stream_provider/two_embed.dart';
import 'package:streamora/data/stream_provider/vidsrc_su.dart';
import 'package:streamora/data/stream_provider/vidzee.dart';
import 'package:streamora/data/stream_provider/x_prime_appolo.dart';
import 'package:streamora/data/stream_provider/x_prime_fox.dart';
import 'package:streamora/data/subtitle_provider/subtitles.dart';
import 'package:streamora/model/provider_data.dart';
import 'package:streamora/model/scrape_streams_data.dart';
import 'package:streamora/model/subtitle_data.dart';
import 'package:streamora/model/video_data.dart';
import 'package:streamora/presentation/video/video_screen.dart';

class SearchingStreamsScreen extends ConsumerStatefulWidget {
  final String backdrop;
  final bool isWatching;
  final StreamSearchData movieData;
  const SearchingStreamsScreen({
    super.key,
    required this.movieData,
    required this.backdrop,
    this.isWatching = true,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchingStreamsScreenState();
}

class _SearchingStreamsScreenState
    extends ConsumerState<SearchingStreamsScreen> {
  bool isStreamsDone = false;
  bool isSubtitlesDone = false;
  bool streamFound = false;
  bool searchingSubtitles = false;
  bool searchingStreams = true;
  List<SubtitleData> _subtitleData = [];

  final List<ProviderData> _providerData = [
    ProviderData(
      providerName: "AutoEmbed",
      providerFunction: autoEmbedStreamProvider,
      videoDataList: [],
    ),
    ProviderData(
      providerName: "VidsrcSu",
      providerFunction: vidsrcStreamProvider,
      videoDataList: [],
    ),
    ProviderData(
      providerName: "Vidzee",
      providerFunction: vidzeeStreamProvider,
      videoDataList: [],
    ),
    ProviderData(
      providerName: "NetFree",
      providerFunction: netFreeStreamProvider,
      videoDataList: [],
    ),
    ProviderData(
      providerName: "XPrimeFox",
      providerFunction: xPrimeFoxStreamProvider,
      videoDataList: [],
    ),
    ProviderData(
      providerName: "XPrimeAppolo",
      providerFunction: xPrimeAppoloStreamProvider,
      videoDataList: [],
    ),
    ProviderData(
      providerName: "FlixHQ",
      providerFunction: flixHQStreamProvider,
      videoDataList: [],
    ),
    ProviderData(
      providerName: "TwoEmbed",
      providerFunction: twoEmbedStreamProvider,
      videoDataList: [],
    ),
  ];

  Future<void> getSubtitles() async {
    setState(() {
      searchingSubtitles = true;
    });
    try {
      List<SubtitleData> subtitleList = await ref.read(
        subtitlesProvider(imdbId: widget.movieData.imdbId).future,
      );
      if (!mounted) return;
      if (subtitleList.isNotEmpty) {
        setState(() {
          _subtitleData = subtitleList;
        });
      }
    } catch (e) {
      debugPrint("Subtitle error: $e");
    }

    setState(() {
      searchingSubtitles = false;
      isSubtitlesDone = true;
    });

    _maybeNavigateToVideoScreen();
  }

  Future<void> searchVideoStreams() async {
    for (final provider in _providerData) {
      if (streamFound && widget.isWatching) break;

      setState(() => provider.isSearching = true);
      try {
        final providerInstance =
            provider.providerFunction(movieData: widget.movieData);
        List<VideoData> result = await ref.read(providerInstance.future);
        if (result.isNotEmpty) {
          streamFound = true;
          setState(() {
            provider.videoDataList = result;
            provider.streamFound = true;
            provider.isSearching = false;
          });
        } else {
          setState(() {
            provider.streamFound = false;
            provider.isSearching = false;
          });
        }
      } catch (_) {
        setState(() {
          provider.streamFound = false;
          provider.isSearching = false;
        });
      }
    }

    setState(() {
      isStreamsDone = true;
    });

    _maybeNavigateToVideoScreen();
  }

  void _maybeNavigateToVideoScreen() {
    if (!mounted) return;
    if (isStreamsDone && isSubtitlesDone) {
      if (widget.isWatching) {
        if (!streamFound) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              showCloseIcon: true,
              closeIconColor: Colors.white,
              content: const Text("No streams found!",
                  style: TextStyle(color: Colors.white)),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.fade,
              child: VideoScreen(
                backdrop: widget.backdrop,
                movieData: widget.movieData,
                subtitleDataList: _subtitleData,
                providerDataList: _providerData,
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              behavior: SnackBarBehavior.floating,
              showCloseIcon: true,
              closeIconColor: Theme.of(context).colorScheme.onPrimary,
              content: Text(
                "Stream Found!",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            behavior: SnackBarBehavior.floating,
            showCloseIcon: true,
            closeIconColor: Theme.of(context).colorScheme.onPrimary,
            content: Text(
              "Download Feature Coming Soon!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getSubtitles();
      searchVideoStreams();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> providerWidgets = _providerData.map((provider) {
      return ListTile(
        title: Text(provider.providerName),
        subtitle: provider.streamFound == null
            ? const Text("Searching...")
            : provider.streamFound == true
                ? const Text("Streams found")
                : const Text("No streams found."),
        trailing: provider.isSearching == true
            ? const CircularProgressIndicator()
            : provider.streamFound == true
                ? const Icon(Icons.check, color: Colors.green)
                : const Icon(Icons.close, color: Colors.red),
      );
    }).toList();

    List<Widget> subtitleWidgets = [];

    if (searchingSubtitles) {
      subtitleWidgets.add(
        const ListTile(
          title: Text("Subtitles"),
          subtitle: Text("Searching..."),
          trailing: CircularProgressIndicator(),
        ),
      );
    } else if (_subtitleData.isEmpty) {
      subtitleWidgets.add(
        const ListTile(
          title: Text("Subtitles"),
          subtitle: Text("No subtitles found."),
          trailing: Icon(Icons.close, color: Colors.red),
        ),
      );
    } else {
      subtitleWidgets.add(
        const ListTile(
          title: Text("Subtitles"),
          subtitle: Text("Subtitles found."),
          trailing: Icon(Icons.check, color: Colors.green),
        ),
      );
      subtitleWidgets.addAll(
        _subtitleData.map((subtitle) {
          return ListTile(
            title: Text(subtitle.subtitleLanguage),
            subtitle: Text(subtitle.subtitleUrl),
            trailing: const Icon(Icons.subtitles),
          );
        }).toList(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.movieData.title} (${widget.movieData.year})"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Streaming Providers",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ...providerWidgets,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text("Subtitles",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            ...subtitleWidgets,
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
