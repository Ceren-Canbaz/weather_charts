import 'package:flutter/material.dart';
import 'package:weather_charts/models/entities/daily_weather.dart';

class RainfallChart extends StatelessWidget {
  final List<DailyWeather> dailyWeatherList;

  RainfallChart({required this.dailyWeatherList});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(double.infinity, 300), // Canvas size
      painter: RainfallChartPainter(dailyWeatherList),
    );
  }
}

class RainfallChartPainter extends CustomPainter {
  final List<DailyWeather> dailyWeatherList;

  RainfallChartPainter(this.dailyWeatherList);

  @override
  void paint(Canvas canvas, Size size) {
    final double chartPadding = 40.0; // Padding for the chart
    final double chartHeight = size.height - chartPadding * 3;
    final double chartWidth = size.width - chartPadding * 2;

    // Maximum rainfall values
    final double maxTotalRainfall = _calculateMaxTotalRainfall();
    final double maxHourlyRainfall = _calculateMaxHourlyRainfall();
    final double middleRainfall = maxTotalRainfall / 2; // Mid value for Y-axis

    // Paint objects
    final Paint linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;
    final Paint gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 0.5;

    // Step size for bars and X-axis
    double xOffset = chartPadding;
    final double stepX = chartWidth / (dailyWeatherList.length - 1);
    final double barWidth = stepX / 2;

    // Gradient for bars
    final Gradient barGradient = LinearGradient(
      colors: [Colors.lightBlue.shade200, Colors.blue],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );

    // Draw the legend at the top
    _drawLegend(canvas, chartPadding, chartWidth);

    // Draw the grid lines and right-side Y-axis values (0, mid, max)
    const int yDivisions = 8;
    for (int i = 0; i <= yDivisions; i++) {
      final double y =
          chartPadding * 2 + chartHeight - (chartHeight / yDivisions) * i;

      // Draw grid lines
      canvas.drawLine(
        Offset(chartPadding, y),
        Offset(chartPadding + chartWidth, y),
        gridPaint,
      );

      // Only display 3 values: 0, mid, and max
      if (i == 0 || i == yDivisions / 2 || i == yDivisions) {
        String label = '';
        if (i == 0) {
          label = '0';
        } else if (i == yDivisions / 2) {
          label = middleRainfall.toStringAsFixed(1);
        } else if (i == yDivisions) {
          label = maxTotalRainfall.toStringAsFixed(1);
        }

        // Draw right-side Y-axis labels
        final TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: label,
            style: const TextStyle(color: Colors.grey, fontSize: 10),
          ),
          textAlign: TextAlign.right,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(chartPadding + chartWidth + 20, y - textPainter.height / 2),
        );
      }
    }

    // Draw bars and X-axis day labels
    final List<Offset> linePoints = [];
    for (int i = 0; i < dailyWeatherList.length; i++) {
      final dailyWeather = dailyWeatherList[i];

      // Calculate total and max rainfall for the day
      final double totalRainfall = dailyWeather.hourlyWeather
          .fold(0.0, (sum, weather) => sum + weather.rainfall);
      final double maxRainfall = dailyWeather.hourlyWeather
          .map((weather) => weather.rainfall)
          .reduce((a, b) => a > b ? a : b);

      // Normalize the values
      final double normalizedTotal =
          chartHeight * (totalRainfall / maxTotalRainfall);
      final double normalizedMax =
          chartHeight * (maxRainfall / maxHourlyRainfall);

      // Draw gradient bar
      final Paint barPaint = Paint()
        ..shader = barGradient.createShader(Rect.fromLTWH(
          xOffset - barWidth / 2,
          chartPadding * 2 + chartHeight - normalizedMax,
          barWidth,
          normalizedMax,
        ));
      canvas.drawRect(
        Rect.fromLTWH(
          xOffset - barWidth / 2,
          chartPadding * 2 + chartHeight - normalizedMax,
          barWidth,
          normalizedMax,
        ),
        barPaint,
      );

      // Add line point
      linePoints.add(Offset(
        xOffset,
        chartPadding * 2 + chartHeight - normalizedTotal,
      ));

      // Draw day label under the bar
      final String dayLabel = _getDayName(i);
      final TextPainter dayTextPainter = TextPainter(
        text: TextSpan(
          text: dayLabel,
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );
      dayTextPainter.layout();
      dayTextPainter.paint(
        canvas,
        Offset(xOffset - dayTextPainter.width / 2,
            chartPadding * 2 + chartHeight + 5),
      );

      xOffset += stepX; // Move to the next X position
    }

    // Draw line graph
    if (linePoints.length > 1) {
      final Path path = Path()..moveTo(linePoints[0].dx, linePoints[0].dy);
      for (int i = 1; i < linePoints.length; i++) {
        path.lineTo(linePoints[i].dx, linePoints[i].dy);
      }
      canvas.drawPath(path, linePaint);
    }

    // Draw X-axis
    canvas.drawLine(
      Offset(chartPadding, chartPadding * 2 + chartHeight),
      Offset(chartPadding + chartWidth, chartPadding * 2 + chartHeight),
      gridPaint,
    );
  }

  void _drawLegend(Canvas canvas, double chartPadding, double chartWidth) {
    // Legend circle size
    const double circleRadius = 6.0;

    // Day legend (light blue gradient)
    final Paint dayLegendPaint = Paint()..color = Colors.lightBlue.shade200;
    canvas.drawCircle(
      Offset(chartPadding, chartPadding / 2),
      circleRadius,
      dayLegendPaint,
    );

    final TextPainter dayTextPainter = TextPainter(
      text: TextSpan(
        text: "Day",
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    dayTextPainter.layout();
    dayTextPainter.paint(
        canvas, Offset(chartPadding + 15, chartPadding / 2 - circleRadius));

    // Total legend (blue line)
    final Paint totalLegendPaint = Paint()..color = Colors.blue;
    canvas.drawCircle(
      Offset(chartPadding + 80, chartPadding / 2),
      circleRadius,
      totalLegendPaint,
    );

    final TextPainter totalTextPainter = TextPainter(
      text: TextSpan(
        text: "Total",
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    totalTextPainter.layout();
    totalTextPainter.paint(
        canvas, Offset(chartPadding + 95, chartPadding / 2 - circleRadius));
  }

  double _calculateMaxTotalRainfall() {
    double maxRainfall = 0.0;
    for (var dailyWeather in dailyWeatherList) {
      final double totalRainfall = dailyWeather.hourlyWeather
          .fold(0.0, (sum, weather) => sum + weather.rainfall);
      if (totalRainfall > maxRainfall) maxRainfall = totalRainfall;
    }
    return maxRainfall;
  }

  double _calculateMaxHourlyRainfall() {
    double maxRainfall = 0.0;
    for (var dailyWeather in dailyWeatherList) {
      final double maxHourlyRainfall = dailyWeather.hourlyWeather
          .map((weather) => weather.rainfall)
          .reduce((a, b) => a > b ? a : b);
      if (maxHourlyRainfall > maxRainfall) maxRainfall = maxHourlyRainfall;
    }
    return maxRainfall;
  }

  String _getDayName(int index) {
    const List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[index % 7];
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
