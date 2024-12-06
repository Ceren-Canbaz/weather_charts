import 'package:flutter/material.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';
import 'package:weather_charts/models/weather.dart';
import 'package:weather_charts/utils/enums.dart';
import 'package:weather_charts/views/widgets/charts/rainfall_chart.dart';
import 'package:weather_charts/views/widgets/charts/temperature__dynamic_chart.dart';
import 'package:weather_charts/views/widgets/charts/temperature_chart.dart';
import 'package:weather_charts/views/widgets/charts/wind_direction_chart.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';

// Widget to display details of a specific chart
class ChartDetailView extends StatelessWidget {
  final Chart chart; // The chart type to display

  const ChartDetailView({
    super.key,
    required this.chart,
  });

  @override
  Widget build(BuildContext context) {
    // Retrieve the list of daily weather data from the ViewModel
    final weathers =
        WeatherViewModelNotifier.of(context).weathersNotifier.value;

    // Extract high temperatures from daily weather data
    final highTemperatures =
        weathers.map((weather) => weather.highTemperature).toList();

    // Extract low temperatures from daily weather data
    final lowTemperatures =
        weathers.map((weather) => weather.lowTemperature).toList();

    // Store the list of daily weather data
    final dailyWeatherList = weathers;

    // Retrieve the hourly weather data for the first day
    final hourlyWeather = weathers.first.hourlyWeather;

    return Scaffold(
      appBar: AppBar(
        title:
            Text(chart.title), // Set the AppBar title based on the chart type
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display the chart's description
            Text(
              chart.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16), // Add vertical spacing

            // Display the appropriate chart based on the chart type
            SizedBox(
              height: 300, // Fixed height for the chart widget
              width:
                  MediaQuery.of(context).size.width, // Full width of the screen
              child: _getChart(
                chart,
                dailyWeatherList: dailyWeatherList,
                highTemperatures: highTemperatures,
                lowTemperatures: lowTemperatures,
                hourlyWeather: hourlyWeather,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to return the appropriate chart widget based on the chart type
  Widget _getChart(
    Chart chart, {
    required List<DailyWeather> dailyWeatherList, // List of daily weather data
    required List<double> highTemperatures, // List of high temperatures
    required List<double> lowTemperatures, // List of low temperatures
    required List<Weather> hourlyWeather, // List of hourly weather data
  }) {
    switch (chart) {
      case Chart.weeklyRainfall:
        // Return the rainfall chart widget
        return RainfallChart(dailyWeatherList: dailyWeatherList);

      case Chart.weeklyAvarageTemperature:
        // Return the temperature chart widget for high and low temperatures
        return TemperatureChart(
          highTemperatures: highTemperatures,
          lowTemperatures: lowTemperatures,
        );

      case Chart.weeklyDetailedAvarageTemperature:
        // Return the dynamic temperature chart widget
        return TemperatureDynamicChart(
          highTemperatures: highTemperatures,
          lowTemperatures: lowTemperatures,
        );

      case Chart.wind:
        // Return the wind direction chart widget
        return WindDirectionChart(hourlyWeather: hourlyWeather);

      default:
        // Default fallback if the chart type is unsupported
        return const Center(child: Text("Chart not available."));
    }
  }
}
