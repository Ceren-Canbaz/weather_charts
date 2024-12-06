import 'package:flutter/material.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';
import 'package:weather_charts/views/widgets/weather_widgets/current_weather.dart';
import 'package:weather_charts/views/widgets/weather_widgets/weather_hour_card.dart';

/// A widget that displays today's weather details.
///
/// This widget consists of:
/// - A [CurrentWeatherWidget] that shows the current weather information.
/// - A horizontally scrollable row of [WeatherHourCard] widgets,
///   each representing the hourly weather data for the current day.
class TodayWeather extends StatelessWidget {
  const TodayWeather({
    super.key,
    required this.weathers,
  });

  final List<DailyWeather> weathers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CurrentWeatherWidget(),
        const SizedBox(
          height: 12,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: weathers.first.hourlyWeather.map((w) {
              return WeatherHourCard(
                weather: w,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
