import 'package:flutter/material.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';
import 'package:weather_charts/utils/app_constants.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';
import 'package:weather_charts/views/widgets/weather_widgets/today_weather.dart';
import 'package:weather_charts/views/widgets/weather_widgets/weather_day_card.dart';
import 'package:weather_charts/views/widgets/weather_widgets/weather_hour_card.dart';

class LoadedWidget extends StatelessWidget {
  const LoadedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weathers =
        WeatherViewModelNotifier.of(context).weathersNotifier.value;

    return Column(
      children: [
        TodayWeather(weathers: weathers),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: weathers.length,
            itemBuilder: (context, index) {
              final weather = weathers[index];
              return WeatherDayCard(
                day: dayList[index],
                highTemp: weather.highTemperature,
                lowTemp: weather.lowTemperature,
              );
            },
          ),
        ),
      ],
    );
  }
}
