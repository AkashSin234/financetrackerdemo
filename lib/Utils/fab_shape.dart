import 'dart:math';
import 'package:flutter/material.dart';

class FabShape extends ShapeBorder {
  final double borderRadius;
  final String iconText;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;

  const FabShape({
    this.borderRadius = 17.0,
    this.iconText = '+',
    this.fontFamily = 'SFPro',
    this.fontSize = 32.0,
    this.fontWeight = FontWeight.bold,
  });

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

    return path.transform(matrix.storage);
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect,
        textDirection: textDirection); // Inner path is same as outer path
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // Create a paint object for the solid color
    final paint = Paint()
      ..color = const Color.fromRGBO(61, 77, 217, 1)
      ..style = PaintingStyle.fill; // Use fill to cover the shape

    // Draw the shape
    canvas.drawPath(getOuterPath(rect), paint);

    // Create a TextPainter to draw the icon/text in the center
    final textPainter = TextPainter(
      text: TextSpan(
        text: iconText,
        style: TextStyle(
          fontFamily: fontFamily,
          color: Colors.white,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    )..layout();

    // Calculate the center of the shape
    final centerX = rect.width / 2;
    final centerY = rect.height / 2;

    // Translate text position to be centered
    final textOffset = Offset(
      centerX - (textPainter.width / 2),
      centerY - (textPainter.height / 2),
    );

    // Paint the text at the centered offset
    textPainter.paint(canvas, textOffset);
  }

  @override
  ShapeBorder scale(double t) => FabShape(
        borderRadius: borderRadius * t,
        iconText: iconText,
        fontFamily: fontFamily,
        fontSize: fontSize * t,
        fontWeight: fontWeight,
      );
}
