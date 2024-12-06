import 'package:flutter/material.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';
import 'package:weather_charts/models/weather.dart';
import 'package:weather_charts/services/weather_service.dart';
import 'package:weather_charts/utils/enums.dart';

// ViewModel to manage weather data and state
class WeatherViewModel extends ChangeNotifier {
  // Notifier to track the state of weather data (initial, loading, loaded, error)
  final ValueNotifier<WeatherState> stateNotifier =
      ValueNotifier(WeatherState.initial);

  // Notifier to hold the list of daily weather data
  final ValueNotifier<List<DailyWeather>> weathersNotifier = ValueNotifier([]);

  // Weather service instance for fetching weather data
  final WeatherService _weatherService = WeatherService();

  // Method to fetch weather data from the WeatherService
  Future<void> fetchWeathers() async {
    stateNotifier.value = WeatherState.loading; // Set the state to 'loading'

    try {
      final weathers =
          await _weatherService.getWeathers(); // Fetch weather data
      weathersNotifier.value = weathers; // Update the weather data notifier
      stateNotifier.value = WeatherState.loaded; // Set the state to 'loaded'
    } catch (e) {
      stateNotifier.value =
          WeatherState.error; // Set the state to 'error' on failure
      print("Error: $e"); // Log the error
    }
  }

  // Method to get the current weather based on the current hour
  Weather getCurrentWeather() {
    final now = DateTime.now(); // Get the current time
    final hourlyWeather = weathersNotifier
        .value.first.hourlyWeather; // Access the first day's hourly weather

    // Find the weather record matching the current hour
    return hourlyWeather.firstWhere(
      (weather) => weather.timeStamp.hour == now.hour,
    );
  }
}

// A custom InheritedNotifier to provide access to WeatherViewModel in the widget tree
class WeatherViewModelNotifier extends InheritedNotifier<WeatherViewModel> {
  const WeatherViewModelNotifier({
    super.key,
    required WeatherViewModel super.notifier,
    required super.child,
  });

  // Helper method to retrieve WeatherViewModel from the context
  static WeatherViewModel of(BuildContext context) {
    final notifier =
        context.dependOnInheritedWidgetOfExactType<WeatherViewModelNotifier>();
    assert(notifier != null,
        'No WeatherViewModel found in context'); // Ensure the notifier exists
    return notifier!.notifier!;
  }
}
