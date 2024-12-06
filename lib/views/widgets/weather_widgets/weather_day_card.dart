import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(12.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 200,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Text(
              '$highTemp°C',
              style: const TextStyle(fontSize: 16, color: Colors.redAccent),
            ),
            const SizedBox(height: 4),
            Text(
              '$lowTemp°C',
              style: const TextStyle(fontSize: 14, color: Colors.blueAccent),
            ),
            Text(
              day,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
