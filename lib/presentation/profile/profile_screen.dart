import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/core/common/util.dart';
import 'package:streamora/presentation/search/search_screen.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            const Text('P R O F I L E'),
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
      body: Center(
        child: Text(
          'Profile Screen',
        ),
      ),
    );
  }
}
