import 'package:flutter/material.dart';
import 'package:weather_charts/utils/enums.dart';
import 'package:weather_charts/viewmodels/weather_viewmodel.dart';
import 'package:weather_charts/views/widgets/error_widget.dart';
import 'package:weather_charts/views/widgets/initial_widget.dart';
import 'package:weather_charts/views/widgets/loaded_widget.dart';
import 'package:weather_charts/views/widgets/loading_widget.dart';

class WeatherView extends StatelessWidget {
  final WeatherViewModel viewModel;

  WeatherView({super.key, required this.viewModel}) {
    viewModel.fetchWeathers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<WeatherState>(
        valueListenable: viewModel.stateNotifier,
        builder: (context, state, _) {
          switch (state) {
            case WeatherState.initial:
              return const InitialWidget();
            case WeatherState.loading:
              return const LoadingWidget();
            case WeatherState.loaded:
              return LoadedWidget(viewModel: viewModel);
            case WeatherState.error:
              return ErrorTextWidget(
                viewModel: viewModel,
              );
          }
        },
      ),
    );
  }
}
