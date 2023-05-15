import 'package:flutter/material.dart';

class HeaderPaintWaves extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect =
        Rect.fromCircle(center: const Offset(200, 0), radius: 180);

    const Gradient gradient = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xffddc4fd),
          //  Color(0xff66A1EE),
          Color(0xff90c5fb),
        ],
        stops: [
          0.6,
          1.0
        ]);

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill
      ..strokeWidth = 10;

    final path = Path();
    path.lineTo(0, size.height*0.96);
    path.quadraticBezierTo(size.width * 0.30, size.height * 1,
        size.width * 0.5, size.height *0.90);
    path.quadraticBezierTo(
        size.width * 0.80, size.height * 0.79, size.width, size.height * 0.90);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
