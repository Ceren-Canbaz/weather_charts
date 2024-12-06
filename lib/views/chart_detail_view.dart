import 'package:flutter/material.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';
import 'package:weather_charts/models/weather.dart';
import 'package:weather_charts/utils/enums.dart';
import 'package:weather_charts/views/widgets/charts/rainfall_chart.dart';
import 'package:weather_charts/views/widgets/charts/temperature__dynamic_chart.dart';
import 'package:weather_charts/views/widgets/charts/temperature_chart.dart';
import 'package:weather_charts/views/widgets/charts/wind_direction_chart.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';

class ChartDetailView extends StatelessWidget {
  final Chart chart;

  const ChartDetailView({
    super.key,
    required this.chart,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = WeatherViewModelNotifier.of(context);
    final weathers = viewModel.weathersNotifier.value;

    // highTemperatures ve lowTemperatures'ı ayıkla
    final highTemperatures =
        weathers.map((weather) => weather.highTemperature).toList();
    final lowTemperatures =
        weathers.map((weather) => weather.lowTemperature).toList();
    final dailyWeatherList = weathers; // Günlük hava durumu listesi
    final hourlyWeather = weathers.first.hourlyWeather;

    return Scaffold(
      appBar: AppBar(
        title: Text(chart.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              chart.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
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

  Widget _getChart(
    Chart chart, {
    required List<DailyWeather> dailyWeatherList,
    required List<double> highTemperatures,
    required List<double> lowTemperatures,
    required List<Weather> hourlyWeather,
  }) {
    switch (chart) {
      case Chart.weeklyRainfall:
        return RainfallChart(dailyWeatherList: dailyWeatherList);
      case Chart.weeklyAvarageTemperature:
        return TemperatureChart(
          highTemperatures: highTemperatures,
          lowTemperatures: lowTemperatures,
        );
      case Chart.weeklyDetailedAvarageTemperature:
        return TemperatureDynamicChart(
          highTemperatures: highTemperatures,
          lowTemperatures: lowTemperatures,
        );
      case Chart.wind:
        return WindDirectionChart(hourlyWeather: hourlyWeather);
      default:
        return const Center(child: Text("Chart not available."));
    }
  }
}
