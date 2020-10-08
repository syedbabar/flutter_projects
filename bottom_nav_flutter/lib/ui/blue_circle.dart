import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlueCircle extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.blue
    ..strokeWidth = 0
//     Use [PaintingStyle.fill] if you want the circle to be filled.
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawOval(
      Rect.fromLTWH(0, 0, size.width, size.height),
      _paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
