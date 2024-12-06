import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';
import 'package:weather_charts/models/weather.dart';

/// A service class to fetch weather data from a local JSON file.
///
/// The [WeatherService] class provides the following functionality:
/// - Reads weather data from `assets/weather.json`.
/// - Parses the JSON data into a list of [DailyWeather] objects.
/// - Each [DailyWeather] object includes:
///   - A list of hourly weather data ([Weather] objects).
///   - The highest temperature of the day.
///   - The lowest temperature of the day.
///
/// Key Functions:
/// - getWeathers(): Asynchronously loads and processes the weather data.
///
/// Usage:
/// - Call `getWeathers()` to get a list of daily weather data.

class WeatherService {
  Future<List<DailyWeather>> getWeathers() async {
    final String response = await rootBundle.loadString('assets/weather.json');
    final List<dynamic> jsonWeatherData = json.decode(response);

    final List<DailyWeather> dailyWeatherList =
        jsonWeatherData.map((dailyData) {
      final List<Weather> hourlyWeather = (dailyData as List<dynamic>)
          .map((weather) => Weather.fromMap(weather as Map<String, dynamic>))
          .toList();

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
    }).toList();

    return dailyWeatherList;
  }
}
