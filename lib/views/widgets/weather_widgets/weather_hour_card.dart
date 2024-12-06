import 'package:flutter/material.dart';
import 'package:weather_charts/models/weather.dart';

class WeatherHourCard extends StatelessWidget {
  final Weather weather;

  const WeatherHourCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final time = weather.timeStamp;
    final formattedTime =
        '${time.hour % 12 == 0 ? 12 : time.hour % 12} ${time.hour >= 12 ? 'PM' : 'AM'}';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(16.0),
      width: 120,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF5D9CEC),
            Color.fromARGB(
              255,
              7,
              31,
              60,
            ),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            formattedTime,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${weather.temperature.toStringAsFixed(1)}°C',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.air,
                size: 16,
                color: Colors.white70,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                '${weather.wind.speed.toStringAsFixed(1)} km/h',
                style: const TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.water_drop, size: 16, color: Colors.white70),
              const SizedBox(width: 4),
              Text(
                '${weather.rainfall.toStringAsFixed(1)} mm',
                style: const TextStyle(fontSize: 12, color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
