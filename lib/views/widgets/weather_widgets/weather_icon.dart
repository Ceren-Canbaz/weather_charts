import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final double temperature;
  final double size;

  const WeatherIcon({
    super.key,
    required this.temperature,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    String imagePath;

    if (temperature <= 0) {
      imagePath = 'assets/pngs/sn.png';
    } else if (temperature > 0 && temperature <= 15) {
      imagePath = 'assets/pngs/cloudy.png';
    } else if (temperature > 15 && temperature <= 25) {
      imagePath = 'assets/pngs/sunandcloud.png';
    } else {
      imagePath = 'assets/pngs/sun.png';
    }

    return Image.asset(
      imagePath,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
