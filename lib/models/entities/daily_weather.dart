import 'package:weather_charts/models/weather.dart';

class DailyWeather {
  final List<Weather> hourlyWeather;
  final double highTemperature;
  final double lowTemperature;

  DailyWeather({
    required this.hourlyWeather,
    required this.highTemperature,
    required this.lowTemperature,
  });
}
