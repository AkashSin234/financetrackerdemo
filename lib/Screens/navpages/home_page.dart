import 'package:finance_tracker/Utils/fab_shape.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final gradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
    Color.fromRGBO(61, 77, 217, 1),
    Color.fromRGBO(23, 39, 191, 1)
  ]);

  final textstyle = GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w500);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
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
                      'good evening',
                      style: GoogleFonts.inter(
                          color: const Color.fromRGBO(61, 77, 217, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'Prashant',
                      style: GoogleFonts.inter(
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
              Text(
                'Your expenses',
                style: GoogleFonts.inter(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Baseline(baseline: 40,
                  baselineType: TextBaseline.alphabetic,
                    child: ShaderMask(shaderCallback: (bounds) {
                      return gradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
                    },
                      child: Text('₹', style: textstyle.copyWith(
                          color: Colors.white, // Set text color to white so the gradient shows
                        ),)),
                  ),
                  const Text(
                    '58,910.27',
                    style: TextStyle(
                      letterSpacing: 2.05,
                      fontFamily: 'Satoshi',
                      fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 40,
                        ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  const Text(
                    '₹98,450 ',
                    style: TextStyle(
                      fontFamily: 'Satoshi',
                        color: const Color.fromRGBO(61, 77, 217, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                   Text(
                    'allocated',
                    style: GoogleFonts.inter(fontSize: 13, color: Colors.black, fontWeight: FontWeight.w400)
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('List comes here'),
        ],
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
             // Remove elevation
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
    const shape = FabShape();
    shape.paint(canvas, rect);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
