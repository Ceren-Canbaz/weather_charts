import 'package:flutter_test/flutter_test.dart';
import 'package:weather_charts/models/wind.dart';

import 'dart:convert';

void main() {
  group('Wind Model Tests', () {
    test('Wind from JSON should parse correctly', () {
      final json = {
        "speed": 15.0,
        "direction": 0.0,
      };

      final wind = Wind.fromMap(json);

      expect(wind.speed, 15.0);
      expect(wind.direction, 0.0);
    });

    test('Wind from asset mock data', () async {
      const String mockJson = '''
        [
          {
            "timeStamp": "2024-12-02T00:00:00.000",
            "temperature": 26.3,
            "wind": {
              "speed": 15.0,
              "direction": 0.0
            },
            "rainfall": null
          }
        ]
      ''';

      final List<dynamic> data = json.decode(mockJson);

      final windData = data.first['wind'] as Map<String, dynamic>;
      final wind = Wind.fromMap(windData);

      expect(wind.speed, 15.0);
      expect(wind.direction, 0.0);
    });
  });
}
