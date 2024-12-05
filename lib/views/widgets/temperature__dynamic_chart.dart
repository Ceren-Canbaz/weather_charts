import 'package:flutter/material.dart';

class TemperatureDynamicChart extends StatelessWidget {
  final List<double> highTemperatures;
  final List<double> lowTemperatures;
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  TemperatureDynamicChart({
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

  _TemperatureChartPainter({
    required this.highTemperatures,
    required this.lowTemperatures,
    required this.days,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.black87
      ..style = PaintingStyle.fill;

    final Paint gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 1;

    final Paint highTempPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final Paint lowTempPaint = Paint()
      ..color = Colors.lightBlueAccent
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final Paint highShadowPaint = Paint()
      ..color = Colors.blue.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final Paint lowShadowPaint = Paint()
      ..color = Colors.lightBlueAccent.withOpacity(0.3)
      ..style = PaintingStyle.fill;

    final TextPainter textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    // Draw background
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    final double maxY =
        (highTemperatures + lowTemperatures).reduce((a, b) => a > b ? a : b);
    final double minY =
        (highTemperatures + lowTemperatures).reduce((a, b) => a < b ? a : b);

    final double chartHeight = size.height - 60;
    final double chartWidth = size.width - 60;
    final double xStep = chartWidth / (days.length - 1);
    final double yStep = chartHeight / (maxY - minY);

    // Draw horizontal grid lines
    for (int i = 0; i <= 5; i++) {
      final double y = size.height - 40 - i * (chartHeight / 5);

      canvas.drawLine(Offset(30, y), Offset(size.width - 30, y), gridPaint);

      final String label =
          (minY + (i * ((maxY - minY) / 5))).toStringAsFixed(0);
      textPainter.text = TextSpan(
        text: label,
        style: const TextStyle(color: Colors.grey, fontSize: 10),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(10, y - textPainter.height / 2));
    }

    // Draw X-axis labels
    for (int i = 0; i < days.length; i++) {
      final double x = 30 + i * xStep;
      final double y = size.height - 40;

      textPainter.text = TextSpan(
        text: days[i],
        style: const TextStyle(color: Colors.grey, fontSize: 10),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x - textPainter.width / 2, y + 5));
    }

    // High Temperature Shadow
    final Path highShadowPath = Path();
    for (int i = 0; i < highTemperatures.length; i++) {
      final double x = 30 + i * xStep;
      final double y = size.height - 40 - (highTemperatures[i] - minY) * yStep;

      if (i == 0) {
        highShadowPath.moveTo(x, y);
      } else {
        highShadowPath.lineTo(x, y);
      }
    }
    // Close the path to create the shadow area
    highShadowPath.lineTo(size.width - 30, size.height - 40);
    highShadowPath.lineTo(30, size.height - 40);
    highShadowPath.close();
    canvas.drawPath(highShadowPath, highShadowPaint);

    // Low Temperature Shadow
    final Path lowShadowPath = Path();
    for (int i = 0; i < lowTemperatures.length; i++) {
      final double x = 30 + i * xStep;
      final double y = size.height - 40 - (lowTemperatures[i] - minY) * yStep;

      if (i == 0) {
        lowShadowPath.moveTo(x, y);
      } else {
        lowShadowPath.lineTo(x, y);
      }
    }
    // Close the path to create the shadow area
    lowShadowPath.lineTo(size.width - 30, size.height - 40);
    lowShadowPath.lineTo(30, size.height - 40);
    lowShadowPath.close();
    canvas.drawPath(lowShadowPath, lowShadowPaint);

    // High Temperature Line
    final Path highPath = Path();
    for (int i = 0; i < highTemperatures.length; i++) {
      final double x = 30 + i * xStep;
      final double y = size.height - 40 - (highTemperatures[i] - minY) * yStep;

      if (i == 0) {
        highPath.moveTo(x, y);
      } else {
        highPath.lineTo(x, y);
      }
    }
    canvas.drawPath(highPath, highTempPaint);

    // Low Temperature Line
    final Path lowPath = Path();
    for (int i = 0; i < lowTemperatures.length; i++) {
      final double x = 30 + i * xStep;
      final double y = size.height - 40 - (lowTemperatures[i] - minY) * yStep;

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
