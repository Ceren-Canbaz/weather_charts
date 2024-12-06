import 'package:flutter/material.dart';
import 'package:weather_charts/views/widgets/weather_widgets/weather_icon.dart';

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
          gradient: generateGradient(highTemp),
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
            WeatherIcon(temperature: highTemp),
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

LinearGradient generateGradient(double temperature) {
  if (temperature <= 0) {
    return const LinearGradient(
      colors: [Color(0xFF4A90E2), Color(0xFF50E3C2)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else if (temperature > 0 && temperature <= 20) {
    return const LinearGradient(
      colors: [Color(0xFF50E3C2), Color.fromARGB(255, 186, 183, 88)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else {
    return const LinearGradient(
      colors: [
        Color.fromARGB(255, 177, 106, 65),
        Color.fromARGB(255, 198, 168, 31)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
