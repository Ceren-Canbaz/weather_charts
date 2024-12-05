import 'package:flutter/foundation.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';

import '../services/weather_service.dart';

class WeatherViewModel extends ChangeNotifier {
  final WeatherService _weatherService = WeatherService();

  final ValueNotifier<List<DailyWeather>> weatherData = ValueNotifier([]);

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
