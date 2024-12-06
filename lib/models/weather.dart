import 'package:weather_charts/models/wind.dart';

/// Represents the weather data for a specific time.
///
/// The [Weather] class includes:
/// - [timeStamp] : The timestamp for the weather data.
/// - [temperature] : The temperature at the specified time.
/// - [wind] : A [Wind] object containing wind speed and direction.
/// - [rainfall] : The amount of rainfall at the specified time.
///
/// Provides:
/// - A factory constructor (`fromMap`) to parse weather data from a map.
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
  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      timeStamp: DateTime.parse(map['timeStamp'] as String),
      temperature: (map['temperature'] as num).toDouble(),
      wind: Wind.fromMap(map['wind'] as Map<String, dynamic>),
      rainfall:
          map['rainfall'] != null ? (map['rainfall'] as num).toDouble() : 0.0,
    );
  }
}
