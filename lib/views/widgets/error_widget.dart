import 'package:flutter/material.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';

// A widget to display an error message with a retry button
class ErrorContainer extends StatelessWidget {
  const ErrorContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the WeatherViewModel from the context
    final viewModel = WeatherViewModelNotifier.of(context);

    return Center(
      child: Column(
        mainAxisSize:
            MainAxisSize.min, // Minimize the column's height to its content
        children: [
          // Display the error message
          const Text(
            "An error occurred", // Error message text
            style: TextStyle(
              fontSize: 16, // Set font size
              color: Colors.red, // Set text color to red
            ),
          ),
          const SizedBox(height: 10), // Add vertical spacing

          // Retry button to fetch the data again
          ElevatedButton(
            onPressed: viewModel.fetchWeathers, // Retry fetching weather data
            child: const Text("Retry"), // Button label
          ),
        ],
      ),
    );
  }
}
