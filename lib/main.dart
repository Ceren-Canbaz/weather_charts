import 'package:flutter/material.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';
import 'package:weather_charts/views/weather_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather Charts",
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: WeatherView(),
    );
  }
}
