import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';

import 'package:weather_charts/services/weather_service.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('WeatherService Tests', () {
    late WeatherService weatherService;

    setUp(() {
      weatherService = WeatherService();
    });

    test('getWeathers should return a valid List<DailyWeather>', () async {
      // Mock JSON Data
      const String mockJson = '''
      [
        [
          {
            "timeStamp": "2024-12-02T00:00:00.000",
            "temperature": 26.3,
            "wind": { "speed": 15, "direction": 0 },
            "rainfall": null
          },
          {
            "timeStamp": "2024-12-02T01:00:00.000",
            "temperature": 28.4,
            "wind": { "speed": 6, "direction": 0 },
            "rainfall": null
          }
        ],
        [
          {
            "timeStamp": "2024-12-03T00:00:00.000",
            "temperature": 22.1,
            "wind": { "speed": 10, "direction": 90 },
            "rainfall": 0.1
          },
          {
            "timeStamp": "2024-12-03T01:00:00.000",
            "temperature": 21.0,
            "wind": { "speed": 12, "direction": 180 },
            "rainfall": null
          }
        ]
      ]
      ''';

      // Mock rootBundle
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMessageHandler('flutter/assets', (message) async {
        final String key = utf8.decode(message!.buffer.asUint8List());
        if (key == 'assets/weather.json') {
          final Uint8List uint8list = Uint8List.fromList(utf8.encode(mockJson));
          return ByteData.view(uint8list.buffer); // Convert to ByteData
        }
        return null;
      });

      // Execute getWeathers
      final List<DailyWeather> dailyWeatherList =
          await weatherService.getWeathers();

      // Verify results
      expect(dailyWeatherList.length, 2); // 2 gün olmalı

      // İlk günün high ve low değerleri
      final firstDay = dailyWeatherList[0];
      expect(firstDay.highTemperature, 28.4);
      expect(firstDay.lowTemperature, 26.3);

      // İkinci günün high ve low değerleri
      final secondDay = dailyWeatherList[1];
      expect(secondDay.highTemperature, 22.1);
      expect(secondDay.lowTemperature, 21.0);
    });
  });
}
