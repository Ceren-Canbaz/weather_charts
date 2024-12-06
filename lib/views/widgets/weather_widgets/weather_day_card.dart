import 'package:flutter/material.dart';
import 'package:weather_charts/views/widgets/weather_widgets/weather_icon.dart';

/// A widget that displays a card for a specific day's weather information.
///
/// The card includes the following:
/// - A weather icon based on the high temperature.
/// - The day of the week.
/// - High and low temperature values.
///
/// This widget is designed with padding, a gradient background, and a shadow
/// to provide a visually appealing layout. It uses the `WeatherIcon` widget
/// to display an appropriate icon based on the `highTemp` value.

class WeatherDayCard extends StatelessWidget {
  final String day;
  final double highTemp;
  final double lowTemp;

  const WeatherDayCard({
    super.key,
    required this.day,
    required this.highTemp,
    required this.lowTemp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 109, 108, 115),
            Color.fromARGB(255, 162, 160, 160),
          ]),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WeatherIcon(
              temperature: highTemp,
              size: 42,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    day,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(),
                  ),
                  Text(
                    'High: ${highTemp.toStringAsFixed(1)}°C',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                  ),
                  Text(
                    'Low: ${lowTemp.toStringAsFixed(1)}°C',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
