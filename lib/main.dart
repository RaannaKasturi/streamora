import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:streamora/core/config/util.dart';
import 'package:streamora/data/user_preferences.dart';
import 'package:streamora/presentation/app/app.dart';
import 'package:streamora/presentation/components/streamora_error_widget.dart';
import 'package:streamora/presentation/movie/movie_screen.dart';
import 'package:streamora/presentation/onboarding/welcome_screen.dart';
import 'package:streamora/presentation/series/series_screen.dart';
import 'core/config/theme.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  final appLinks = AppLinks();
  final container = ProviderContainer();
  await container.read(userPreferencesProvider.future);
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MyApp(appLinks: appLinks),
    ),
  );
}

class MyApp extends ConsumerWidget {
  final AppLinks appLinks;
  const MyApp({super.key, required this.appLinks});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    appLinks.uriLinkStream.listen(
      (uri) {
        if (uri.toString().contains("/movie/")) {
          navigatorKey.currentState?.push(
            PageTransition(
              type: PageTransitionType.fade,
              child: MovieScreen(
                movieId:
                    int.parse(uri.toString().split("movie/")[1].split("-")[0]),
                movieTitle: "",
              ),
            ),
          );
        } else if (uri.toString().contains("/tv/")) {
          navigatorKey.currentState?.push(
            PageTransition(
              type: PageTransitionType.fade,
              child: SeriesScreen(
                seriesId:
                    int.parse(uri.toString().split("tv/")[1].split("-")[0]),
                seriesTitle: "",
              ),
            ),
          );
        } else {
          navigatorKey.currentState?.push(
            PageTransition(
              type: PageTransitionType.fade,
              child: const App(),
            ),
          );
        }
      },
      onError: (error) {
        navigatorKey.currentState?.pushAndRemoveUntil(
          PageTransition(
            type: PageTransitionType.fade,
            child: const App(),
          ),
          (route) => false,
        );
        navigatorKey.currentState?.push(
          PageTransition(
            type: PageTransitionType.fade,
            child: const Scaffold(
              body: Center(
                child: StreamoraErrorWidget(),
              ),
            ),
          ),
        );
      },
    );

    Future<bool> notificationStatus() async {
      final status = await Permission.notification.isGranted;
      return status;
    }

    final userPreferences = ref.watch(userPreferencesProvider);
    final userTheme = userPreferences.value?.theme ?? "dark";
    TextTheme textTheme = createTextTheme(context, "Poppins", "Inter Tight");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Streamora',
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: userTheme == "dark" ? ThemeMode.dark : ThemeMode.light,
      home: FutureBuilder<bool>(
        future: notificationStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/brand/logo_light.png"),
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 2,
                  ),
                ],
              ),
            );
          }
          return snapshot.data == true ? const App() : const WelcomeScreen();
        },
      ),
    );
  }
}
