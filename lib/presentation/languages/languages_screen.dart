import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/core/common/util.dart';
import 'package:streamora/data/constants/languages_data.dart';
import 'package:streamora/model/movie_language_data.dart';
import 'package:streamora/presentation/languages/individual_language_screen.dart';
import 'package:streamora/presentation/search/search_screen.dart';

class LanguagesScreen extends ConsumerStatefulWidget {
  const LanguagesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LanguagesScreenState();
}

class _LanguagesScreenState extends ConsumerState<LanguagesScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late TabController _tabController;
  List<LanguageData> languages = LanguagesData().languages;
  List<LanguageData> filteredLanguages = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {});
      }
    });
    filteredLanguages = languages;
  }

  void _onSearch({required String query}) {
    setState(() {
      _isLoading = true;
    });

    final results = languages.where((lang) {
      return lang.englishName.toLowerCase().contains(query.toLowerCase()) ||
          lang.languageName.toLowerCase().contains(query.toLowerCase()) ||
          lang.isoCode.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredLanguages = results;
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 10),
            Image.asset(
              getLogo(ref),
              height: 32,
            ),
            const SizedBox(width: 8),
            const Text('L A N G U A G E S'),
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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for Language',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {
                            filteredLanguages = languages;
                          });
                        },
                      ),
                    ),
                    onTapOutside: (_) => FocusScope.of(context).unfocus(),
                    onSubmitted: (value) {
                      _onSearch(query: value.trim());
                      FocusScope.of(context).unfocus();
                    },
                    onChanged: (value) {
                      if (value.isEmpty) {
                        setState(() {
                          filteredLanguages = languages;
                        });
                      } else {
                        _onSearch(query: value.trim());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
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
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: filteredLanguages.length,
                        itemBuilder: (BuildContext context, int index) {
                          final lang = filteredLanguages[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              child: Text(
                                lang.isoCode,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            title: Text(
                              lang.englishName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            subtitle: lang.languageName != ""
                                ? Text(
                                    lang.languageName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant
                                              .withAlpha((0.6 * 255).toInt()),
                                        ),
                                  )
                                : null,
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: IndividualLanguageScreen(
                                    languageName: lang.englishName,
                                    languageCode: lang.isoCode,
                                    mediaType: "movie",
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: filteredLanguages.length,
                        itemBuilder: (BuildContext context, int index) {
                          final lang = filteredLanguages[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              child: Text(
                                lang.isoCode,
                                style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            title: Text(
                              lang.englishName,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            subtitle: lang.languageName != ""
                                ? Text(
                                    lang.languageName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurfaceVariant
                                              .withAlpha((0.6 * 255).toInt()),
                                        ),
                                  )
                                : null,
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: IndividualLanguageScreen(
                                    languageName: lang.englishName,
                                    languageCode: lang.isoCode,
                                    mediaType: "tv",
                                  ),
                                ),
                              );
                            },
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
