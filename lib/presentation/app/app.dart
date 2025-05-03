import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/presentation/genres/genres_screen.dart';
import 'package:streamora/presentation/home/home_screen.dart';
import 'package:streamora/presentation/languages/languages_screen.dart';
import 'package:streamora/presentation/profile/profile_screen.dart';
import 'package:streamora/presentation/search/search_screen.dart';

class App extends StatefulWidget {
  final int initialIndex;
  const App({super.key, this.initialIndex = 0});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.index = widget.initialIndex;
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
    return PopScope(
      canPop: _tabController.index != 0,
      onPopInvokedWithResult: (didPop, result) {
        if (_tabController.index != 0) {
          setState(() {
            _tabController.index = 0;
          });
        }
      },
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            HomeScreen(),
            GenresScreen(),
            LanguagesScreen(),
            ProfileScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          selectedItemColor: Theme.of(context).colorScheme.onPrimary,
          unselectedItemColor: Theme.of(context)
              .colorScheme
              .onPrimary
              .withAlpha((0.6 * 255).toInt()),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          currentIndex: _tabController.index,
          type: BottomNavigationBarType.fixed,
          iconSize: 28,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Genres',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.translate),
              label: 'Languages',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            setState(() {
              _tabController.index = index;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            Navigator.of(context).push(
              PageTransition(
                type: PageTransitionType.bottomToTop,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOut,
                child: const SearchScreen(),
              ),
            );
          },
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}
