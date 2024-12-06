import 'package:flutter/material.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';
import 'package:weather_charts/utils/app_constants.dart';
import 'package:weather_charts/views/widgets/weather_widgets/weather_day_card.dart';

/// A widget that displays the weekly weather forecast.
///
/// It consists of a column of [WeatherDayCard] widgets, each representing
/// the weather information for a specific day of the week. The cards display:
/// - The day of the week.
/// - High and low temperature values.
/// - A weather icon representing the daily high temperature.

class WeekWeather extends StatelessWidget {
  const WeekWeather({
    super.key,
    required this.weathers,
  });

  final List<DailyWeather> weathers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: weathers.map(
        (weather) {
          return WeatherDayCard(
            day: dayList[weathers.indexOf(
              weather,
            )],
            highTemp: weather.highTemperature,
            lowTemp: weather.lowTemperature,
          );
        },
      ).toList(),
    );
  }
}
