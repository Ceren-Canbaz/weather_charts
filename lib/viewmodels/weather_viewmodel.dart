import 'package:flutter/material.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';
import 'package:weather_charts/services/weather_service.dart';
import 'package:weather_charts/utils/enums.dart';

class WeatherViewModel {
  final WeatherService _weatherService = WeatherService();

  // State ve veriler için ValueNotifier kullanımı
  final ValueNotifier<WeatherState> stateNotifier =
      ValueNotifier(WeatherState.initial);
  final ValueNotifier<List<DailyWeather>> weathersNotifier = ValueNotifier([]);

  Future<void> fetchWeathers() async {
    stateNotifier.value = WeatherState.loading;

    try {
      final weathers = await _weatherService.getWeathers();
      weathersNotifier.value = weathers;
      stateNotifier.value = WeatherState.loaded;
    } catch (e) {
      print("Error: $e");
      stateNotifier.value = WeatherState.error;
    }
  }
}
