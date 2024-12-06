import 'package:flutter/material.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';

import 'package:weather_charts/views/widgets/weather_widgets/chart_card_button.dart';
import 'package:weather_charts/views/widgets/weather_widgets/chart_grid.dart';
import 'package:weather_charts/views/widgets/weather_widgets/today_weather.dart';
import 'package:weather_charts/views/widgets/weather_widgets/week_weather.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final weathers =
        WeatherViewModelNotifier.of(context).weathersNotifier.value;

    return ListView(
      shrinkWrap: true,
      children: [
        TodayWeather(weathers: weathers),
        const SizedBox(height: 12),
        WeekWeather(weathers: weathers),
        const ChartGrid(),
      ],
    );
  }
}
