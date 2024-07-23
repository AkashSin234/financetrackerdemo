import 'dart:math';
import 'package:flutter/material.dart';

class FabShape extends ShapeBorder {
  final double borderRadius; // Radius for the rounded corners

  const FabShape({this.borderRadius = 17.0});

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.all(borderRadius);

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final path = Path();
    final radius = borderRadius;

    // Create kite-like shape
    path.moveTo(rect.width / 2, rect.top);
    path.lineTo(rect.right, rect.height / 2);
    path.lineTo(rect.width / 2, rect.bottom);
    path.lineTo(rect.left, rect.height / 2);
    path.close();

    // Create rounded rectangle and combine it with kite-like shape
    path.addRRect(RRect.fromRectAndRadius(rect, Radius.circular(radius)));

    // Apply rotation transformation
    final matrix = Matrix4.identity()
      ..translate(rect.center.dx, rect.center.dy)
      ..rotateZ(pi / 4) // Rotate 45 degrees
      ..translate(-rect.center.dx, -rect.center.dy);

    final transformedPath = path.transform(matrix.storage);

    return transformedPath;
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect,
        textDirection: textDirection); //innerpath is same as outer path
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // Define the gradient
    const gradient = LinearGradient(
      colors: [Color.fromRGBO(61, 77, 217, 1), Color.fromRGBO(46,57,154,1)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    // Create a paint object for the gradient
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill; // Use fill to cover the shape

    // Draw the gradient shape
    canvas.drawPath(getOuterPath(rect), paint);
  }

  @override
  ShapeBorder scale(double t) => FabShape(borderRadius: borderRadius * t);
}
