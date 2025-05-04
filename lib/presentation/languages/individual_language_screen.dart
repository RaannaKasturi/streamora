import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/core/common/util.dart';
import 'package:streamora/data/tmdb_provider/details_by_language.dart';
import 'package:streamora/presentation/components/movie_tv_list.dart';
import 'package:streamora/presentation/search/search_screen.dart';

class IndividualLanguageScreen extends ConsumerWidget {
  final String languageName;
  final String languageCode;
  final String mediaType;
  const IndividualLanguageScreen({
    super.key,
    required this.languageName,
    required this.languageCode,
    required this.mediaType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesByLanguage = ref.watch(
      getDetailsByLanguageProvider(
        languageISO: languageCode,
        mediaType: mediaType,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Image.asset(
              getLogo(ref),
              height: 32,
            ),
            const SizedBox(width: 8),
            Text(
              languageName.toUpperCase().splitMapJoin("",
                  onMatch: (m) => " ", onNonMatch: (n) => n.toUpperCase()),
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const SearchScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: MovieTVList(
        nowPlayingMovies: moviesByLanguage,
        sectionTitle: '',
      ),
    );
  }
}
