import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:streamora/presentation/onboarding/get_notifications_permission.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    final logo = brightness == Brightness.light
        ? 'assets/brand/logo_light.png'
        : 'assets/brand/logo_dark.png';
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      logo,
                      height: 32,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'S T R E A M O R A',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w900, fontSize: 30),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Welcome to the World of\nUnlimited Entertainment!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 3,
                      ),
                ),
              ],
            ),
            Lottie.asset(
              'assets/lotties/welcome.json',
              height: 300,
              width: 300,
              fit: BoxFit.cover,
              repeat: true,
              reverse: true,
              animate: true,
              frameRate: FrameRate.composition,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const GetNotificationsPermission(),
                  ),
                );
              },
              label: Text("Get Started"),
              icon: Icon(Icons.arrow_forward_ios_rounded),
              iconAlignment: IconAlignment.end,
            ),
          ],
        ),
      ),
    );
  }
}
