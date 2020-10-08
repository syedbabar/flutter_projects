import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UnFilledPinkCircle extends CustomPainter {
  final _paint = Paint()
    ..color = Colors.pink
    ..strokeWidth = 1
//     Use [PaintingStyle.fill] if you want the circle to be filled.
    ..style = PaintingStyle.stroke;

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
