import 'package:flutter/material.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';

class ErrorContainer extends StatelessWidget {
  const ErrorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = WeatherViewModelNotifier.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "An error occurred",
            style: TextStyle(fontSize: 16, color: Colors.red),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: viewModel.fetchWeathers,
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
