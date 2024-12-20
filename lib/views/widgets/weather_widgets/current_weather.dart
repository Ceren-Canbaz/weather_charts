import 'package:flutter/material.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';
import 'package:weather_charts/views/widgets/weather_widgets/weather_icon.dart';

/// A widget that displays the current weather information.
///
/// This widget includes:
/// - A [WeatherIcon] to visually represent the current temperature.
/// - The current temperature displayed in large text.
/// - Additional details such as:
///   - Wind speed, represented with an icon and text.
///   - Rainfall amount, represented with an icon and text.

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = WeatherViewModelNotifier.of(context);

    final currentWeather = viewModel.getCurrentWeather();

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WeatherIcon(
          temperature: viewModel.getCurrentWeather().temperature,
          size: 54,
        ),
        Text(
          '${currentWeather.temperature.toStringAsFixed(1)}°C',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.w200,
              ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.air, size: 16, color: Colors.blueAccent),
            const SizedBox(
              width: 4,
            ),
            Text(
              '${currentWeather.wind.speed.toStringAsFixed(1)} km/h',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.water_drop, size: 16, color: Colors.blueGrey),
            const SizedBox(width: 4),
            Text(
              'Rain: ${currentWeather.rainfall.toStringAsFixed(1)} mm',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
