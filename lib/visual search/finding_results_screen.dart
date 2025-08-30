import 'dart:io';
import 'package:flutter/material.dart';

class FindingResultsScreen extends StatelessWidget {
  const FindingResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // optional: show picked image preview
    final imagePath = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null) ...[
              Image.file(File(imagePath), height: 150),
              const SizedBox(height: 20),
            ],
            const Icon(Icons.search, size: 50, color: Colors.red),
            const SizedBox(height: 20),
            const Text(
              "Finding similar results...",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
