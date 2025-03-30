import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:streamora/presentation/home/home_screen.dart';

class GetNotificationsPermission extends StatelessWidget {
  const GetNotificationsPermission({super.key});

  @override
  Widget build(BuildContext context) {
    void requestNotificationPermission() async {
      final status = await Permission.notification.request();
      if (status.isGranted) {
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: HomeScreen(),
          ),
        );
      } else if (status.isDenied) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).colorScheme.error,
            content: Text(
              'Notification permission denied',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onError,
                  ),
            ),
          ),
        );
      } else if (status.isRestricted) {
        requestNotificationPermission();
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      }
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Allow Streamora to send you notifications?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              const Text(
                'We will send you notifications about new movies, shows, and updates.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: requestNotificationPermission,
                child: const Text('Allow Notifications'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
