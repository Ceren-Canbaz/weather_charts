import 'package:flutter/material.dart';

// A widget to display weather icons based on temperature
class WeatherIcon extends StatelessWidget {
  final double temperature; // The temperature to determine the appropriate icon
  final double size; // The size of the icon (default: 50)

  const WeatherIcon({
    super.key,
    required this.temperature, // Temperature input
    this.size = 50, // Default size of the icon
  });

  @override
  Widget build(BuildContext context) {
    String imagePath; // Variable to hold the image path based on temperature

    // Determine the icon based on temperature ranges
    if (temperature <= 0) {
      // Snow icon for temperatures 0°C or below
      imagePath = 'assets/pngs/sn.png';
    } else if (temperature > 0 && temperature <= 15) {
      // Cloudy icon for temperatures between 1°C and 15°C
      imagePath = 'assets/pngs/cloudy.png';
    } else if (temperature > 15 && temperature <= 25) {
      // Partly sunny icon for temperatures between 16°C and 25°C
      imagePath = 'assets/pngs/sunandcloud.png';
    } else {
      // Sunny icon for temperatures above 25°C
      imagePath = 'assets/pngs/sun.png';
    }

    // Return the weather icon as an Image widget
    return Image.asset(
      imagePath, // Path to the icon image
      width: size, // Set the width of the icon
      height: size, // Set the height of the icon
      fit: BoxFit.contain, // Maintain the aspect ratio of the image
    );
  }
}
