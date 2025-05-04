import 'package:flutter/material.dart';
import 'package:streamora/data/subtitle_provider/download_subs.dart';
import 'package:streamora/model/subtitle_data.dart';

class TestSubs extends StatefulWidget {
  const TestSubs({super.key});

  @override
  State<TestSubs> createState() => _TestSubsState();
}

class _TestSubsState extends State<TestSubs> {
  List<SubtitleData> subs = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Subs'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                final subsData =
                    await DownloadSubs().downloadSubs(imdbId: "tt14513804");
                setState(() {
                  subs = subsData;
                });
              },
              child: const Text('Download Subs'),
            ),
            subs.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: subs.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(subs[index].subtitleLanguage),
                          subtitle: Text(subs[index].subtitleUrl),
                        );
                      },
                    ),
                  )
                : const Text('No subtitles available'),
          ],
        ),
      ),
    );
  }
}
