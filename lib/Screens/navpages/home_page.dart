import 'package:finance_tracker/Utils/fab_shape.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 70, left: 12, right: 12),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.black),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good evening',
                        style: GoogleFonts.montserrat(
                            color: const Color.fromRGBO(178, 52, 255, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        'Prashant',
                        style: GoogleFonts.montserrat(
                            fontSize: 14, color: Colors.black),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  const Icon(
                    Icons.more_vert_outlined,
                    color: Colors.black,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Your expenses',
                  style: TextStyle(
                      fontFamily: 'SFPro',
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 22,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [
                              Color.fromRGBO(178, 52, 255, 1),
                              Color.fromRGBO(62, 0, 100, 1)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcIn,
                        child: Image.asset(
                          'assets/rupee-indian.png',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      '17,750.00',
                      style: GoogleFonts.manrope(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                      child: Image.asset(
                        'assets/rupee-indian.png',
                        color: const Color.fromRGBO(178, 52, 255, 1),
                      ),
                    ),
                    Text(
                      '98,450 ',
                      style: GoogleFonts.montserrat(
                          color: Color.fromRGBO(178, 52, 255, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    const Text(
                      'allocated',
                      style: TextStyle(
                          fontFamily: 'SFPro',
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text('List comes here'),
          ],
        ),
      ),
      floatingActionButton: Stack(
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
            splashColor: Colors.black, // Remove elevation
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 32,
            ), //just for testing that the button is actually a button
          ),
        ],
      ),
    );
  }
}

class FabShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final shape = FabShape();
    shape.paint(canvas, rect);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
