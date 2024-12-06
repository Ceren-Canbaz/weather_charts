import 'package:flutter/material.dart';
import 'package:weather_charts/utils/enums.dart';
import 'package:weather_charts/views/chart_detail_view.dart';
import 'package:weather_charts/views/widgets/weather_widgets/chart_card_button.dart';

/// A widget that displays a grid of chart options.
///
/// This widget consists of:
/// - A [GridView] with a fixed number of columns (2).
/// - Each grid item is a [ChartCardButton] that represents a specific chart.
/// - When a chart button is tapped, it navigates to the `ChartDetailView`
///   for the selected chart.
///
/// Key Features:
/// - Dynamic grid generation using `Chart.values`.
/// - Displays chart images and titles.
/// - Responsive layout with spacing between grid items.

class ChartButtonGrid extends StatelessWidget {
  const ChartButtonGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 400,
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 1.0,
        ),
        children: Chart.values.map((chart) {
          return ChartCardButton(
            imagePath: chart.imagePath,
            description: chart.title,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChartDetailView(chart: chart),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
