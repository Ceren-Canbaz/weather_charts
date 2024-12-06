import 'package:flutter/material.dart';
import 'package:weather_charts/utils/enums.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';
import 'package:weather_charts/views/widgets/error_widget.dart';
import 'package:weather_charts/views/widgets/home_widget.dart';
import 'package:weather_charts/views/widgets/loading_widget.dart';

///[WeatherView] The main view for displaying weather data
class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Retrieve the ViewModel from the context
    final viewModel = WeatherViewModelNotifier.of(context);

    // Fetch weather data if state is initial
    if (viewModel.stateNotifier.value == WeatherState.initial) {
      viewModel.fetchWeathers();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve the ViewModel from the context
    final viewModel = WeatherViewModelNotifier.of(context);

    return Scaffold(
      backgroundColor:
          Colors.black, // Set background color to black for a clean design
      body: ValueListenableBuilder<WeatherState>(
        valueListenable: viewModel.stateNotifier, // Listen for state changes
        builder: (context, state, _) {
          // Render different widgets based on the state
          switch (state) {
            case WeatherState.initial:
            case WeatherState.loading:
              // Show a loading spinner while data is being fetched
              return const LoadingWidget();
            case WeatherState.loaded:
              // Display the home view when data is successfully loaded
              return const HomeView();
            case WeatherState.error:
              // Display an error message if data fetching fails
              return const ErrorContainer();
          }
        },
      ),
    );
  }
}
