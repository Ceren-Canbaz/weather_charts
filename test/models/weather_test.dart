import 'package:flutter_test/flutter_test.dart';
import 'package:weather_charts/models/weather.dart';

import 'package:flutter/services.dart';
import 'dart:convert';

/// This test file validates the functionality of the `Weather` model,
/// ensuring it correctly parses JSON data into Dart objects.
///
/// The `ensureInitialized()` method is called to initialize the Flutter
/// testing environment, allowing access to the `rootBundle` for loading
/// assets like JSON files.
///
/// The tests cover:
/// - Parsing a JSON file into a list of `Weather` objects.
/// - Validating the integrity of the parsed data, including timestamps,
///   temperature, wind speed and direction, and rainfall.
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Weather Model Tests with Asset Data', () {
    test('Weather list should parse correctly from asset file', () async {
      final String response =
          await rootBundle.loadString('assets/weather.json');

      final List<dynamic> jsonData = json.decode(response);

      final List<Weather> weatherList = jsonData
          .map((data) => Weather.fromMap(data as Map<String, dynamic>))
          .toList();

      expect(weatherList.length, 24);

      expect(
          weatherList[0].timeStamp, DateTime.parse("2024-12-02T00:00:00.000"));
      expect(weatherList[0].temperature, 26.3);
      expect(weatherList[0].wind.speed, 15.0);
      expect(weatherList[0].wind.direction, 0.0);
      expect(weatherList[0].rainfall, 0.0);

      expect(
          weatherList[1].timeStamp, DateTime.parse("2024-12-02T01:00:00.000"));
      expect(weatherList[1].temperature, 28.4);
      expect(weatherList[1].wind.speed, 6.0);
      expect(weatherList[1].wind.direction, 0.0);
      expect(weatherList[1].rainfall, 0.0);
    });
  });
}
