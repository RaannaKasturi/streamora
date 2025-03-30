import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streamora/core/config/util.dart';
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
      home: HomeScreen(),
    );
  }
}
