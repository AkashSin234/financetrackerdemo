import 'package:flutter/material.dart';

class ColorPallette {
  static final ColorPallette shared = ColorPallette._();

  ColorPallette._();

  final Color accentColor = _colorFromHex("3D4DD9");

  final Color icon1 = _colorFromHex("FFA2A2");
  final Color icon2 = _colorFromHex("FFBEA2");
  final Color icon3 = _colorFromHex("A79DFC");
  final Color icon4 = _colorFromHex("CDA1FF");
  final Color icon5 = _colorFromHex("A7CAFF");
  final Color icon6 = _colorFromHex("FFD596");
  final Color icon7 = _colorFromHex("F197F3");
  final Color icon8 = _colorFromHex("BEBCCF");

  final Color greenCapsule = _colorFromHex("73FFAB");
  final Color redCapsule = _colorFromHex("FF9797");

  final Color progressBarUFLight = _colorFromHex("E7E6E6");
  final Color progressBarUFDark = _colorFromHex("2A2A2A");

  final Gradient progressBarF = LinearGradient(
    colors: [_colorFromHex("3D4DD9"), _colorFromHex("1727BF")],
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
  );

  static Color _colorFromHex(String hex) {
    hex = hex.replaceFirst('#', '');
    if (hex.length == 6) {
      hex = 'FF$hex'; // Add alpha if not provided
    }
    return Color(int.parse(hex, radix: 16));
  }
}