import 'package:flutter/material.dart';
import 'package:finance_tracker/Widgets/fabshapewidget.dart';
import 'package:finance_tracker/Widgets/keyboardkey.dart'; // Import the custom widget
import 'package:google_fonts/google_fonts.dart';

class CustomKeyboard extends StatefulWidget {
  const CustomKeyboard({super.key});

  @override
  State<CustomKeyboard> createState() => _CustomKeyboard();
}

class _CustomKeyboard extends State<CustomKeyboard> {
  late List<List<dynamic>> keys;
  late String amount; //was showing error for some reason hence late

  final gradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromRGBO(61, 77, 217, 1), Color.fromRGBO(23, 39, 191, 1)],
  );

  final textStyle =
      GoogleFonts.inter(fontSize: 25, fontWeight: FontWeight.w500);
  @override
  void initState() {
    super.initState();

    keys = [
      ['7', '8', '9'],
      ['4', '5', '6'],
      ['1', '2', '3'],
      ['.', '0', 'FabShape'],
    ];

    amount = '';
  }

  onKeyTap(String val) {
    setState(() {
      amount += val;
    });
  }

  onBackspacePress() {
    //to be used for eraser
    setState(() {
      amount = amount.substring(0, amount.length - 1);
    });
  }

  renderKeyboard() {
    return keys
        .map((x) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: x.map((y) {
                return Container(
                  width: 100, // Adjust width as necessary
                  height: 100, // Adjust height as necessary
                  alignment: Alignment.center,
                  child: y == 'FabShape'
                      ? GestureDetector(
                          onTap: () {
                            // Handle the tap for FabShape here
                          },
                          child: const FabShapeWidget(),
                        )
                      : KeyboardKey(
                          label: y,
                          onTap: (val) {
                            if (val is Widget) {
                              onBackspacePress();
                            } else {
                              onKeyTap(val);
                            }
                            // Handle the tap for the other keys here
                          },
                          value: y,
                        ),
                );
              }).toList(),
            ))
        .toList();
  }

  Widget renderAmount() {
    return Expanded(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return gradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                );
              },
              child: Text(
                '₹',
                style: textStyle.copyWith(
                  color: Colors
                      .white, // Set text color to white so the gradient shows
                ),
              ),
            ),
            Text(
              amount.isEmpty ? '0' : '$amount',
              style: const TextStyle(
                  fontFamily: 'Satoshi',
                  fontSize: 35,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          renderAmount(),
          ...renderKeyboard(),
        ]),
      ),
    );
  }
}
