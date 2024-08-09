import 'package:flutter/material.dart';
import 'package:finance_tracker/Utils/fab_shape.dart';

class FabShapeWidget extends StatelessWidget {
  const FabShapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      shape: FabShape(
        iconText: '✓', // Custom icon text
        fontFamily: 'Satoshi', // Custom font family
        fontSize: 25.0, // Custom font size
        fontWeight: FontWeight.w400, // Custom font weight
      ),
      color: Color.fromRGBO(61, 77, 217, 1), // Background color
      child: SizedBox(
        width: 50, // Adjust as necessary
        height: 50, // Adjust as necessary
      ),
    );
  }
}
