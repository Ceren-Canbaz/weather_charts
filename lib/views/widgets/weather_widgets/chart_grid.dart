import 'package:flutter/material.dart';
import 'package:weather_charts/utils/enums.dart';
import 'package:weather_charts/views/chart_detail_view.dart';
import 'package:weather_charts/views/widgets/weather_widgets/chart_card_button.dart';

class ChartGrid extends StatelessWidget {
  const ChartGrid({
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
