import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:streamora/core/config/util.dart';
import 'package:streamora/onboarding/welcome_screen.dart';
import 'package:streamora/presentation/home/home_screen.dart';
import 'core/config/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Future<bool> notificationStatus() async {
      final status = await Permission.notification.isGranted;
      return status;
    }

    // final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Poppins", "Inter Tight");
    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Streamora',
      theme: theme.light(),
      darkTheme: theme.dark(),
      // themeMode:
      //     brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark,
      themeMode: ThemeMode.light,
      home: const WelcomeScreen(),
      // home: FutureBuilder<bool>(
      //   future: notificationStatus(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Image.asset("assets/brand/logo_light.png"),
      //             const SizedBox(height: 20),
      //             const CircularProgressIndicator(
      //               color: Colors.blue,
      //               strokeWidth: 2,
      //             ),
      //           ],
      //         ),
      //       );
      //     }
      //     return snapshot.data == true
      //         ? const HomeScreen()
      //         : const WelcomeScreen1();
      //   },
      // ),
    );
  }
}
