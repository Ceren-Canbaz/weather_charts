import 'dart:math';
import 'package:flutter/material.dart';
import 'package:weather_charts/models/weather.dart';

class WindDirectionChart extends StatelessWidget {
  final List<Weather> hourlyWeather;

  const WindDirectionChart({super.key, required this.hourlyWeather});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _WindDirectionPainter(hourlyWeather),
    );
  }
}

class _WindDirectionPainter extends CustomPainter {
  final List<Weather> hourlyWeather;

  final List<String> directions = [
    'N',
    'NNE',
    'NE',
    'ENE',
    'E',
    'ESE',
    'SE',
    'SSE',
    'S',
    'SSW',
    'SW',
    'WSW',
    'W',
    'WNW',
    'NW',
    'NNW'
  ];

  _WindDirectionPainter(this.hourlyWeather);

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2) - 20;
    final double sectorAngle = 2 * pi / directions.length;

    final Paint gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final Paint sectorPaint = Paint()..style = PaintingStyle.fill;

    final TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i <= 4; i++) {
      canvas.drawCircle(center, radius * (i / 4), gridPaint);
    }

    for (int i = 0; i < directions.length; i++) {
      final double angle = i * sectorAngle - (pi / 2);

      final Offset start = Offset(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );

      canvas.drawLine(center, start, gridPaint);

      if (i % 2 == 0) {
        final Offset labelPosition = Offset(
          center.dx + (radius + 15) * cos(angle),
          center.dy + (radius + 15) * sin(angle),
        );

        textPainter.text = TextSpan(
          text: directions[i],
          style: const TextStyle(color: Colors.white, fontSize: 16),
        );
        textPainter.layout();
        textPainter.paint(
          canvas,
          Offset(
            labelPosition.dx - textPainter.width / 2,
            labelPosition.dy - textPainter.height / 2,
          ),
        );
      }
    }

    final Map<String, List<double>> groupedData = _groupWindData();

    for (int i = 0; i < directions.length; i++) {
      final String direction = directions[i];
      final List<double> speeds = groupedData[direction] ?? [];

      if (speeds.isNotEmpty) {
        final double averageSpeed =
            speeds.reduce((a, b) => a + b) / speeds.length;

        final double startAngle = i * sectorAngle - (pi / 2);
        final double sweepAngle = sectorAngle;

        sectorPaint.color = _getColorForSpeed(averageSpeed);

        final Path sectorPath = Path()
          ..moveTo(center.dx, center.dy)
          ..arcTo(
            Rect.fromCircle(
                center: center, radius: radius * (averageSpeed / 30)),
            startAngle,
            sweepAngle,
            false,
          )
          ..close();

        canvas.drawPath(sectorPath, sectorPaint);
      }
    }
  }

  Map<String, List<double>> _groupWindData() {
    final Map<String, List<double>> groupedData = {
      for (var dir in directions) dir: []
    };

    for (final weather in hourlyWeather) {
      final double direction = weather.wind.direction;
      final String cardinalDirection = _getDirectionFromDegrees(direction);
      groupedData[cardinalDirection]?.add(weather.wind.speed);
    }

    return groupedData;
  }

  String _getDirectionFromDegrees(double degrees) {
    if (degrees >= 348.75 || degrees < 11.25) return 'N';
    if (degrees >= 11.25 && degrees < 33.75) return 'NNE';
    if (degrees >= 33.75 && degrees < 56.25) return 'NE';
    if (degrees >= 56.25 && degrees < 78.75) return 'ENE';
    if (degrees >= 78.75 && degrees < 101.25) return 'E';
    if (degrees >= 101.25 && degrees < 123.75) return 'ESE';
    if (degrees >= 123.75 && degrees < 146.25) return 'SE';
    if (degrees >= 146.25 && degrees < 168.75) return 'SSE';
    if (degrees >= 168.75 && degrees < 191.25) return 'S';
    if (degrees >= 191.25 && degrees < 213.75) return 'SSW';
    if (degrees >= 213.75 && degrees < 236.25) return 'SW';
    if (degrees >= 236.25 && degrees < 258.75) return 'WSW';
    if (degrees >= 258.75 && degrees < 281.25) return 'W';
    if (degrees >= 281.25 && degrees < 303.75) return 'WNW';
    if (degrees >= 303.75 && degrees < 326.25) return 'NW';
    if (degrees >= 326.25 && degrees < 348.75) return 'NNW';
    return 'N';
  }

  Color _getColorForSpeed(double speed) {
    double opacity = (speed.clamp(0.0, 30.0) / 30.0).clamp(0.1, 1.0);
    return Colors.blue.withOpacity(opacity);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
