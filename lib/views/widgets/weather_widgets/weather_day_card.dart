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
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(14.0),
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
            Icon(
              Icons.wb_sunny_outlined,
              size: 42,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    day,
                    style:
                        Theme.of(context).textTheme.headlineMedium?.copyWith(),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'High: ${highTemp.toStringAsFixed(1)}°C',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(),
                  ),
                  Text(
                    'Low: ${lowTemp.toStringAsFixed(1)}°C',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(),
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
      colors: [Color(0xFF50E3C2), Color(0xFFE9E678)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  } else {
    return const LinearGradient(
      colors: [Color.fromARGB(255, 244, 142, 83), Color(0xFFFFD200)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
