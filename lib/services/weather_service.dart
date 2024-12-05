import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';
import 'package:weather_charts/models/weather.dart';

class WeatherService {
  Future<List<DailyWeather>> getWeathers() async {
    final String response = await rootBundle.loadString('assets/weather.json');
    final List<dynamic> jsonWeatherData = json.decode(response);

    // Tüm saatlik verileri `Weather` nesnelerine dönüştür
    final List<Weather> hourlyWeather = jsonWeatherData
        .map((weather) => Weather.fromMap(weather as Map<String, dynamic>))
        .toList();

    // Günlere göre grupla
    final Map<DateTime, List<Weather>> dailyGroupedWeather = {};

    for (var weather in hourlyWeather) {
      final dayKey = DateTime(
        weather.timeStamp.year,
        weather.timeStamp.month,
        weather.timeStamp.day,
      );

      dailyGroupedWeather.putIfAbsent(dayKey, () => []).add(weather);
    }

    return dailyGroupedWeather.values
        .map((hourlyWeather) => _createDailyWeather(hourlyWeather))
        .toList();
  }

  DailyWeather _createDailyWeather(List<Weather> hourlyWeather) {
    final double highTemperature = hourlyWeather
        .map((weather) => weather.temperature)
        .reduce((a, b) => a > b ? a : b);

    final double lowTemperature = hourlyWeather
        .map((weather) => weather.temperature)
        .reduce((a, b) => a < b ? a : b);

    return DailyWeather(
      hourlyWeather: hourlyWeather,
      highTemperature: highTemperature,
      lowTemperature: lowTemperature,
    );
  }
}
