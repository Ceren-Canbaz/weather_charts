import 'package:flutter/material.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';
import 'package:weather_charts/services/weather_service.dart';
import 'package:weather_charts/views/widgets/rainfall_chart.dart';
import 'package:weather_charts/views/widgets/temperature__dynamic_chart.dart';
import 'package:weather_charts/views/widgets/temperature_chart.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherService weatherService = WeatherService();

    return FutureBuilder<List<DailyWeather>>(
      future: weatherService.getWeathers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No data available.'));
        }

        final List<DailyWeather> dailyWeathers = snapshot.data!;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Weekly Temperature'),
            backgroundColor: Colors.black87,
          ),
          backgroundColor: Colors.black,
          body: ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: RainfallChart(
                      dailyWeatherList: dailyWeathers,
                    )),
              ),
              // const Padding(
              //   padding: EdgeInsets.all(16.0),
              //   child: Text(
              //     "Average Temperature (°F)",
              //     style: TextStyle(
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.white,
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.5,
              //   child: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //       child: TemperatureDynamicChart(
              //         highTemperatures: dailyWeathers
              //             .map((daily) => daily.highTemperature)
              //             .toList(),
              //         lowTemperatures: dailyWeathers
              //             .map((daily) => daily.lowTemperature)
              //             .toList(),
              //       )),
              // ),
              // Divider(),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.5,
              //   child: Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //       child: TemperatureChart(
              //         highTemperatures: dailyWeathers
              //             .map((daily) => daily.highTemperature)
              //             .toList(),
              //         lowTemperatures: dailyWeathers
              //             .map((daily) => daily.lowTemperature)
              //             .toList(),
              //       )),
              // ),
              // const Padding(
              //   padding: EdgeInsets.all(16.0),
              //   child: Text(
              //     "Average temperature is an average of the high and low temperatures recorded for each day",
              //     style: TextStyle(
              //       fontSize: 12,
              //       color: Colors.grey,
              //     ),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
