import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import 'package:streamora/model/video_data.dart';

class SearchingStreamsScreen extends ConsumerStatefulWidget {
  final StreamSearchData movieData;
  const SearchingStreamsScreen({super.key, required this.movieData});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SearchingStreamsScreenState();
}

class _SearchingStreamsScreenState
    extends ConsumerState<SearchingStreamsScreen> {
  List<VideoData> globalVideoDataList = [];
  bool isLoading = true;

  final List<ProviderData> providerData = [
    ProviderData(
        providerName: "AutoEmbed", providerFunction: autoEmbedStreamProvider),
    ProviderData(
        providerName: "TwoEmbed", providerFunction: twoEmbedStreamProvider),
    ProviderData(
        providerName: "VidsrcSu", providerFunction: vidsrcStreamProvider),
    ProviderData(
        providerName: "Vidzee", providerFunction: vidzeeStreamProvider),
    ProviderData(
        providerName: "NetFree", providerFunction: netFreeStreamProvider),
    ProviderData(
        providerName: "XPrimeFox", providerFunction: xPrimeFoxStreamProvider),
    ProviderData(
        providerName: "XPrimeAppolo",
        providerFunction: xPrimeAppoloStreamProvider),
    ProviderData(
        providerName: "FlixHQ", providerFunction: flixHQStreamProvider),
  ];

  Future<void> searchVideoStreams() async {
    for (final provider in providerData) {
      print("Searching streams from ${provider.providerName}...");
      setState(() => provider.isSearching = true);
      try {
        final providerInstance =
            provider.providerFunction(movieData: widget.movieData);
        List<VideoData> result = await ref.read(providerInstance.future);
        if (result.isNotEmpty) {
          globalVideoDataList.addAll(result);
          setState(() {
            globalVideoDataList;
            provider.streamFound = true;
          });
        } else {
          setState(() => provider.streamFound = false);
        }
      } catch (e) {
        setState(() => provider.streamFound = false);
        continue;
      }
      setState(() => provider.isSearching = false);
    }
  }

  @override
  void initState() {
    super.initState();
    searchVideoStreams();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Searching Streams")),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
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
          ),
          const Divider(),
          Expanded(
            flex: 2,
            child: globalVideoDataList.isEmpty
                ? const Center(child: Text("No streams available yet."))
                : ListView.builder(
                    itemCount: globalVideoDataList.length,
                    itemBuilder: (context, index) {
                      final video = globalVideoDataList[index];
                      return ListTile(
                        leading: const Icon(Icons.video_library),
                        trailing: const Icon(Icons.play_arrow),
                        title: Text(video.videoSource),
                        subtitle: Text(
                          video.videoSourceUrl,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
