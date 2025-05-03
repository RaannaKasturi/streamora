import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streamora/core/common/util.dart';
import 'package:streamora/data/user_preferences.dart';
import 'package:streamora/presentation/onboarding/set_location_theme.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPreferences = ref.watch(userPreferencesProvider).value;
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
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        alignment: Alignment.center,
        child: Column(
          children: [
            CircleAvatar(
              radius: 52,
              child: CircleAvatar(
                radius: 50,
                foregroundImage: const CachedNetworkImageProvider(
                  'https://thispersondoesnotexist.com/',
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'John Doe',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 2),
            Text(
              'johndoe@example.com',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text('Dark Mode'),
                    trailing: Switch(
                      value: userPreferences?.theme == 'dark',
                      onChanged: (value) {
                        String countryCode =
                            userPreferences?.countryCode ?? 'IN';
                        String country = userPreferences?.country ?? 'India';
                        ref
                            .read(userPreferencesProvider.notifier)
                            .savePreferences(
                              userPreferences?.country ?? country,
                              userPreferences?.countryCode ?? countryCode,
                              value ? 'dark' : 'light',
                            );
                      },
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.pin_drop),
                    title: const Text('Region'),
                    subtitle: Text(
                      "${userPreferences?.country ?? 'India'} (${userPreferences?.countryCode ?? 'IN'})",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SetLocationTheme(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
