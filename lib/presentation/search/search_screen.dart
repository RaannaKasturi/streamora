import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/data/tmdb.dart';
import 'package:streamora/data/user_preferences.dart';
import 'package:streamora/model/movie_list_data.dart';
import 'package:streamora/presentation/components/streamora_error_widget.dart';
import 'package:streamora/presentation/components/streamora_loading_widget.dart';
import 'package:streamora/presentation/movie/movie_screen.dart';
import 'package:streamora/presentation/series/series_screen.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<MovieListData> _searchResults = [];
  bool _isLoading = false;
  bool _isError = false;

  void _onSearch({required String query}) async {
    setState(() {
      _isLoading = true;
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    try {
      final data = await ref.read(searchResultsProvider(query: query).future);
      setState(() {
        _isLoading = false;
        _searchResults = data;
      });
      if (data.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            showCloseIcon: true,
            closeIconColor: Colors.white,
            content: Text(
              "No results found for '$query'",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      }
    } catch (err) {
      setState(() {
        _isLoading = true;
        _isError = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final logo = ref.watch(userPreferencesProvider).value?.theme == "dark"
        ? 'assets/brand/logo_light.png'
        : 'assets/brand/logo_dark.png';

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 10),
            Image.asset(logo, height: 32),
            const SizedBox(width: 8),
            const Text('S T R E A M O R A'),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 8,
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search for movies or series',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: _isLoading
                          ? const RefreshProgressIndicator(
                              strokeWidth: 3,
                            )
                          : IconButton(
                              icon: Icon(
                                Icons.search,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              onPressed: () {
                                if (_searchController.text.trim().isNotEmpty) {
                                  _onSearch(
                                      query: _searchController.text.trim());
                                  FocusScope.of(context).unfocus();
                                }
                              },
                            ),
                    ),
                    onTapOutside: (_) => FocusScope.of(context).unfocus(),
                    onSubmitted: (value) {
                      _onSearch(query: value.trim());
                      FocusScope.of(context).unfocus();
                    },
                    onChanged: (value) {
                      if (value.isNotEmpty && value.length > 3) {
                        _onSearch(query: value.trim());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          if (_isLoading)
            Flexible(child: StreamoraLoadingWidget())
          else if (_isError)
            Expanded(child: StreamoraErrorWidget()),
          if (_searchResults.isNotEmpty && !_isLoading && !_isError)
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.6,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final movie = _searchResults[index];
                  return InkWell(
                    onTap: () {
                      if (movie.mediaType == "movie") {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: MovieScreen(
                              movieId: movie.id,
                              movieTitle: movie.title,
                            ),
                          ),
                        );
                      } else if (movie.mediaType == "tv") {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: SeriesScreen(
                              seriesId: movie.id,
                              seriesTitle: movie.title,
                            ),
                          ),
                        );
                      } else {
                        debugPrint("Unknown media type: ${movie.mediaType}");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Unknown media type: ${movie.mediaType}\n${movie.title} (${movie.releaseYear})",
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceContainer,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha((0.1 * 255).toInt()),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(8)),
                            child: CachedNetworkImage(
                              imageUrl: movie.poster,
                              height: 225,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${movie.title} (${movie.releaseYear})",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
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
