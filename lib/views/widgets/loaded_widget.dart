import 'package:flutter/material.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';

class LoadedWidget extends StatelessWidget {
  final WeatherViewModel viewModel;

  const LoadedWidget({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<DailyWeather>>(
      valueListenable: viewModel.weathersNotifier,
      builder: (context, weathers, _) {
        return ListView.builder(
          itemCount: weathers.length,
          itemBuilder: (context, index) {
            final weather = weathers[index];
            return ListTile(
              title: Text('${weather.highTemperature}°C'),
              subtitle: Text('${weather.lowTemperature}°C'),
            );
          },
        );
      },
    );
  }
}
