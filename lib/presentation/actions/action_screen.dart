import 'package:flutter/material.dart';

class ActionScreen extends StatelessWidget {
  const ActionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actions'),
      ),
      body: Center(
        child: Text(
          'This is the Action Screen',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
