import 'package:weather_charts/models/weather.dart';

/// Represents daily weather data, including hourly details and daily extremes.
///
/// The [DailyWeather] class includes:
/// - [hourlyWeather] : A list of `Weather` objects for hourly weather data.
/// - [highTemperature] : The highest temperature recorded during the day.
/// - [lowTemperature] : The lowest temperature recorded during the day.
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
