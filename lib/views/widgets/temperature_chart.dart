import 'package:flutter/material.dart';

class TemperatureChart extends StatelessWidget {
  final List<double> highTemperatures;
  final List<double> lowTemperatures;
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  // Constructor to initialize high and low temperatures
  TemperatureChart({
    super.key,
    required this.highTemperatures,
    required this.lowTemperatures,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _TemperatureChartPainter(
        highTemperatures: highTemperatures,
        lowTemperatures: lowTemperatures,
        days: days,
      ),
    );
  }
}

class _TemperatureChartPainter extends CustomPainter {
  final List<double> highTemperatures;
  final List<double> lowTemperatures;
  final List<String> days;

  // Constructor to initialize temperature data and day labels
  _TemperatureChartPainter({
    required this.highTemperatures,
    required this.lowTemperatures,
    required this.days,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Paint for the background
    final Paint backgroundPaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.fill;

    // Paint for the grid lines
    final Paint gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 1;

    // Paint for the high temperature line
    final Paint highTempPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    // Paint for the low temperature line
    final Paint lowTempPaint = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    // Paint for the shadow under the high temperature line
    final Paint highShadowPaint = Paint()
      ..color = Colors.blue.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    // Paint for the shadow under the low temperature line
    final Paint lowShadowPaint = Paint()
      ..color = const Color.fromARGB(255, 26, 28, 29).withOpacity(0.1)
      ..style = PaintingStyle.fill;

    // Text painter for drawing labels
    final TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // Draw the background
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Calculate chart dimensions
    final double chartHeight = size.height - 60;
    final double chartWidth = size.width - 60;
    final double xStep = chartWidth / (days.length - 1);

    // Draw the Y-axis (temperature degrees)
    for (int i = 0; i <= 10; i++) {
      final double y = size.height - 40 - (chartHeight / 10) * i;

      // Draw horizontal grid lines
      canvas.drawLine(Offset(30, y), Offset(size.width - 30, y), gridPaint);

      // Draw Y-axis labels every 5 steps
      if (i % 5 == 0) {
        final int labelValue = i * 10;
        textPainter.text = TextSpan(
          text: "$labelValue°",
          style: const TextStyle(color: Colors.grey, fontSize: 10),
        );
        textPainter.layout();

        textPainter.paint(
          canvas,
          Offset(size.width - 30 + 5, y - textPainter.height / 2),
        );
      }
    }

    // Draw the X-axis (day labels)
    for (int i = 0; i < days.length; i++) {
      final double x = 35 + i * xStep;
      final double y = size.height - 30;

      // Draw day labels
      textPainter.text = TextSpan(
        text: days[i],
        style: const TextStyle(color: Colors.grey, fontSize: 10),
      );
      textPainter.layout();

      textPainter.paint(canvas, Offset(x - (textPainter.width / 1.5), y + 5));
    }

    // Draw the shadow for the high temperature line
    final Path highShadowPath = Path();
    for (int i = 0; i < highTemperatures.length; i++) {
      final double x = 30 + i * xStep;
      final double y =
          size.height - 40 - (highTemperatures[i] / 100) * chartHeight;

      if (i == 0) {
        highShadowPath.moveTo(x, y + 5);
      } else {
        highShadowPath.lineTo(x, y + 5);
      }
    }
    highShadowPath.lineTo(size.width - 30, size.height - 50);
    highShadowPath.lineTo(30, size.height - 50);
    highShadowPath.close();
    canvas.drawPath(highShadowPath, highShadowPaint);

    // Draw the shadow for the low temperature line
    final Path lowShadowPath = Path();
    for (int i = 0; i < lowTemperatures.length; i++) {
      final double x = 30 + i * xStep;
      final double y =
          size.height - 40 - (lowTemperatures[i] / 100) * chartHeight;

      if (i == 0) {
        lowShadowPath.moveTo(x, y + 5);
      } else {
        lowShadowPath.lineTo(x, y + 5);
      }
    }
    lowShadowPath.lineTo(size.width - 30, size.height - 50);
    lowShadowPath.lineTo(30, size.height - 50);
    lowShadowPath.close();
    canvas.drawPath(lowShadowPath, lowShadowPaint);

    // Draw the high temperature line
    final Path highPath = Path();
    for (int i = 0; i < highTemperatures.length; i++) {
      final double x = 30 + i * xStep;
      final double y =
          size.height - 40 - (highTemperatures[i] / 100) * chartHeight;

      if (i == 0) {
        highPath.moveTo(x, y);
      } else {
        highPath.lineTo(x, y);
      }
    }
    canvas.drawPath(highPath, highTempPaint);

    // Draw the low temperature line
    final Path lowPath = Path();
    for (int i = 0; i < lowTemperatures.length; i++) {
      final double x = 30 + i * xStep;
      final double y =
          size.height - 40 - (lowTemperatures[i] / 100) * chartHeight;

      if (i == 0) {
        lowPath.moveTo(x, y);
      } else {
        lowPath.lineTo(x, y);
      }
    }
    canvas.drawPath(lowPath, lowTempPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
