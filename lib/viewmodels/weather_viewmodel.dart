import 'package:flutter/foundation.dart';
import 'package:weather_charts/models/weather.dart';

import '../services/weather_service.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();

  final ValueNotifier<List<Weather>> weatherData = ValueNotifier([]);

  // Fetch weather data and notify listeners
  Future<void> loadWeatherData() async {
    try {
      final data = await _weatherService.getWeathers();
      weatherData.value = data;
      weatherData.notifyListeners();
    } catch (e) {
      // Handle errors
      debugPrint('Error loading weather data: $e');
    }
  }
}
