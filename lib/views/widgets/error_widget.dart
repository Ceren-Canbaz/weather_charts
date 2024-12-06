import 'package:flutter/material.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';

class ErrorTextWidget extends StatelessWidget {
  final WeatherViewModel viewModel;

  const ErrorTextWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
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
            onPressed: () => viewModel.fetchWeathers(),
            child: const Text("Retry"),
          ),
        ],
      ),
    );
  }
}
