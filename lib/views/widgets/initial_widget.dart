import 'package:flutter/material.dart';

// A widget that displays an initial message for the weather app
class InitialWidget extends StatelessWidget {
  const InitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Weather App", // Initial message text
        style: TextStyle(fontSize: 16), // Text style with font size
      ),
    );
  }
}
