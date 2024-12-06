import 'package:flutter/material.dart';

// A widget that shows a loading spinner
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white, // Set the spinner color to white
      ),
    );
  }
}
