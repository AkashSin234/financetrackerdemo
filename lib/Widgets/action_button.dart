import 'package:flutter/material.dart';
import 'package:finance_tracker/Utils/fab_shape.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CustomPaint(
          size: const Size(56.57, 56.57),
          painter: FabShapePainter(),
        ),
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors
              .transparent, // Make background transparent to see the custom shape
          elevation: 0,
          // Remove elevation
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 32,
          ), //just for testing that the button is actually a button
        ),
      ],
    );
  }
}

class FabShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    const shape = FabShape();
    shape.paint(canvas, rect);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
