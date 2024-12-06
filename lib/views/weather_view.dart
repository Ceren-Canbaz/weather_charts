import 'package:flutter/material.dart';
import 'package:weather_charts/utils/enums.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';
import 'package:weather_charts/views/widgets/error_widget.dart';

import 'package:weather_charts/views/widgets/home_widget.dart';
import 'package:weather_charts/views/widgets/loading_widget.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  late WeatherViewModel viewModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel = WeatherViewModelNotifier.of(context);

    if (viewModel.stateNotifier.value == WeatherState.initial) {
      viewModel.fetchWeathers();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ValueListenableBuilder<WeatherState>(
        valueListenable: viewModel.stateNotifier,
        builder: (context, state, _) {
          switch (state) {
            case WeatherState.initial:
            case WeatherState.loading:
              return const LoadingWidget();
            case WeatherState.loaded:
              return const HomeView();
            case WeatherState.error:
              return const ErrorContainer();
          }
        },
      ),
    );
  }
}
