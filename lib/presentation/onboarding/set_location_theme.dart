import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/data/constants/countries_data.dart';
import 'package:streamora/data/user_preferences.dart';
import 'package:streamora/presentation/app/app.dart';

class SetLocationTheme extends ConsumerWidget {
  const SetLocationTheme({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String countryCode = "IN";
    String country = "India";
    Map<String, String> countryMap = {};
    String theme = "dark";

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Set Movies Location",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return DropdownButtonFormField(
                      isExpanded: true,
                      decoration: InputDecoration(
                        labelText: "Select Country",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      items: countriesData.map((country) {
                        return DropdownMenuItem(
                          value: country['iso_3166_1'],
                          child: Text(
                            "${country['english_name']} (${country['iso_3166_1']})",
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      value: "IN",
                      onChanged: (value) {
                        countryMap = countriesData.firstWhere(
                            (country) => country['iso_3166_1'] == value);
                        countryCode = countryMap['iso_3166_1']!;
                        country = countryMap['english_name']!;
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: 80),
              Text(
                "Select App theme",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      labelText: "Select Theme",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: [
                      {"dark": "Dark Theme"},
                      {"light": "Light Theme"},
                      {"system": "Follow System Theme"}
                    ].map((theme) {
                      return DropdownMenuItem(
                        value: theme.keys.first,
                        child: Text(theme.values.first),
                      );
                    }).toList(),
                    value: "dark",
                    onChanged: (value) {
                      theme = value.toString();
                    }),
              ),
              SizedBox(height: 80),
              ElevatedButton.icon(
                onPressed: () {
                  ref
                      .read(userPreferencesProvider.notifier)
                      .savePreferences(country, countryCode, theme);
                  Navigator.pushAndRemoveUntil(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      duration: Duration(milliseconds: 500),
                      child: const App(),
                    ),
                    (route) => false,
                  );
                },
                icon: Icon(Icons.arrow_forward),
                iconAlignment: IconAlignment.end,
                label: Text("Save and Proceed"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
