import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/data/streams_scraping/provider/auto_embed.dart';
import 'package:streamora/data/streams_scraping/provider/flixhq.dart';
import 'package:streamora/data/streams_scraping/provider/netfree.dart';
import 'package:streamora/data/streams_scraping/provider/two_embed.dart';
import 'package:streamora/data/streams_scraping/provider/vidsrc_su.dart';
import 'package:streamora/data/streams_scraping/provider/vidzee.dart';
import 'package:streamora/data/streams_scraping/provider/x_prime_appolo.dart';
import 'package:streamora/data/streams_scraping/provider/x_prime_fox.dart';
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
  bool streamFound = false;
  bool isLoading = true;
  List<SubtitleData> subtitleList = [];

  final List<ProviderData> providerData = [
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

  Future<void> searchVideoStreams() async {
    for (final provider in providerData) {
      if (streamFound && widget.isWatching) {
        break;
      }
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
      } catch (e) {
        setState(() {
          provider.streamFound = false;
          provider.isSearching = false;
        });
        continue;
      }
      setState(() => provider.isSearching = false);
    }
    if (widget.isWatching) {
      if (streamFound == false) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            showCloseIcon: true,
            closeIconColor: Colors.white,
            content: Text(
              "No streams found!",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
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
              subtitleDataList: subtitleList,
              providerDataList: providerData,
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      searchVideoStreams();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.movieData.title} (${widget.movieData.year})"),
      ),
      body: ListView.builder(
        itemCount: providerData.length,
        itemBuilder: (context, index) {
          final provider = providerData[index];
          return ListTile(
            title: Text(provider.providerName),
            subtitle: provider.streamFound == null
                ? const Text("Searching...")
                : provider.streamFound == true
                    ? const Text("Streams found")
                    : const Text("No streams found."),
            trailing: provider.isSearching == null
                ? const Icon(Icons.search)
                : provider.isSearching == true
                    ? const CircularProgressIndicator()
                    : provider.streamFound == true
                        ? const Icon(Icons.check, color: Colors.green)
                        : const Icon(Icons.close, color: Colors.red),
          );
        },
      ),
    );
  }
}
