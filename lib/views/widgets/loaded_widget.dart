import 'package:flutter/material.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';

class LoadedWidget extends StatelessWidget {
  const LoadedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final weathers =
        WeatherViewModelNotifier.of(context).weathersNotifier.value;

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
  }
}
