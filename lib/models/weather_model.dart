import 'package:weather_charts/models/wind_model.dart';

class Weather {
  final DateTime timeStamp;
  final double temperature;
  final Wind wind;
  final double rainfall;

  Weather({
    required this.timeStamp,
    required this.temperature,
    required this.wind,
    required this.rainfall,
  });
}
