import 'package:flutter/material.dart';

class InitialWidget extends StatelessWidget {
  const InitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Press button to load weather",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
