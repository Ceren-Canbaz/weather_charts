import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:weather_charts/models/weather.dart';

class WeatherService {
  Future<List<Weather>> getWeathers() async {
    final String response = await rootBundle.loadString('assets/weather.json');
    final List<dynamic> jsonWeatherData = json.decode(response);
    return jsonWeatherData
        .map(
          (weather) => Weather.fromMap(weather as Map<String, dynamic>),
        )
        .toList();
  }
}
