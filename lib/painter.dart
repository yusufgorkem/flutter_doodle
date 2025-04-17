import 'package:flutter/material.dart';

class DoodlePainter extends CustomPainter {
  final List<Offset?> points;
  final Color strokeColor;
  final double strokeWidth;

  DoodlePainter(this.points, this.strokeColor, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
        ..color = strokeColor
        ..strokeCap = StrokeCap.round
        ..strokeWidth = strokeWidth;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i+1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(DoodlePainter oldDelegate) => true;
}
