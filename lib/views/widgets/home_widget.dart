import 'package:flutter/material.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';
import 'package:weather_charts/views/widgets/weather_widgets/chart_card_button.dart';
import 'package:weather_charts/views/widgets/weather_widgets/chart_button_grid.dart';
import 'package:weather_charts/views/widgets/weather_widgets/today_weather.dart';
import 'package:weather_charts/views/widgets/weather_widgets/week_weather.dart';

// The main view for displaying weather data and chart options
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the list of weather data from the ViewModel
    final weathers =
        WeatherViewModelNotifier.of(context).weathersNotifier.value;

    return ListView(
      shrinkWrap:
          true, // Allow the ListView to take only as much space as needed
      children: [
        // Display today's weather
        TodayWeather(weathers: weathers),
        const SizedBox(height: 12), // Add vertical spacing

        // Display the weekly weather forecast
        WeekWeather(weathers: weathers),
        const SizedBox(height: 12), // Add vertical spacing

        // Display a grid of chart options
        const ChartButtonGrid(),
      ],
    );
  }
}
