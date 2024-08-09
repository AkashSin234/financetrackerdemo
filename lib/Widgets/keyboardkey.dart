import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KeyboardKey extends StatefulWidget {
  final String label;
  final dynamic value;
  final ValueSetter<dynamic> onTap;
  const KeyboardKey(
      {super.key,
      required this.label,
      required this.onTap,
      required this.value});

  @override
  State<KeyboardKey> createState() => _KeyboardKey();
}

class _KeyboardKey extends State<KeyboardKey> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap(widget.value);
      },
      child: AspectRatio(
        aspectRatio: 2,
        child: Center(
          child: Text(widget.label,
              style: const TextStyle(
                fontFamily: 'SFPro',
                fontSize: 25,
                fontWeight: FontWeight.w400,
              )),
        ),
      ),
    );
  }
}
