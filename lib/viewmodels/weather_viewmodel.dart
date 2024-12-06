import 'package:flutter/material.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';
import 'package:weather_charts/models/weather.dart';
import 'package:weather_charts/services/weather_service.dart';
import 'package:weather_charts/utils/enums.dart';

class WeatherViewModel extends ChangeNotifier {
  final ValueNotifier<WeatherState> stateNotifier =
      ValueNotifier(WeatherState.initial);
  final ValueNotifier<List<DailyWeather>> weathersNotifier = ValueNotifier([]);

  final WeatherService _weatherService = WeatherService();

  Future<void> fetchWeathers() async {
    stateNotifier.value = WeatherState.loading;

    try {
      final weathers = await _weatherService.getWeathers();
      weathersNotifier.value = weathers;
      stateNotifier.value = WeatherState.loaded;
    } catch (e) {
      stateNotifier.value = WeatherState.error;
      print("Error: $e");
    }
  }

  Weather getCurrentWeather() {
    final now = DateTime.now();
    final hourlyWeather = weathersNotifier.value.first.hourlyWeather;

    return hourlyWeather.firstWhere(
      (weather) => weather.timeStamp.hour == now.hour,
    );
  }
}

class WeatherViewModelNotifier extends InheritedNotifier<WeatherViewModel> {
  const WeatherViewModelNotifier({
    super.key,
    required WeatherViewModel super.notifier,
    required super.child,
  });

  static WeatherViewModel of(BuildContext context) {
    final notifier =
        context.dependOnInheritedWidgetOfExactType<WeatherViewModelNotifier>();
    assert(notifier != null, 'No WeatherViewModel found in context');
    return notifier!.notifier!;
  }
}
