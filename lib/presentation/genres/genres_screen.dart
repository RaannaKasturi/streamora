import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/core/common/util.dart';
import 'package:streamora/data/tmdb_provider/genres_data.dart';
import 'package:streamora/presentation/genres/individual_genre_screen.dart';
import 'package:streamora/presentation/search/search_screen.dart';

class GenresScreen extends ConsumerStatefulWidget {
  const GenresScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GenresScreenState();
}

class _GenresScreenState extends ConsumerState<GenresScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Map<String, String> movieGenres = GenresData().movieGenres;
  Map<String, String> tvGenres = GenresData().tvGenres;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            const Text('G E N R E S'),
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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Theme.of(context).colorScheme.onSurface,
            unselectedLabelColor: Theme.of(context)
                .colorScheme
                .primary
                .withAlpha((0.6 * 255).toInt()),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Theme.of(context).colorScheme.primary,
            tabs: const [
              Tab(text: "Movies"),
              Tab(text: "TV Series"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const PageScrollPhysics(),
              children: [
                GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: movieGenres.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: IndividualGenreScreen(
                                  genreName:
                                      movieGenres.values.elementAt(index),
                                  genreId: movieGenres.keys.elementAt(index),
                                  mediaType: "movie",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2.0,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha((0.25 * 255).toInt()),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              movieGenres.values.elementAt(index),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: tvGenres.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                type: PageTransitionType.fade,
                                child: IndividualGenreScreen(
                                  genreName: tvGenres.values.elementAt(index),
                                  genreId: tvGenres.keys.elementAt(index),
                                  mediaType: "tv",
                                ),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2.0,
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withAlpha((0.25 * 255).toInt()),
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              tvGenres.values.elementAt(index),
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
