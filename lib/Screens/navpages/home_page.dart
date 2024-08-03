import 'package:finance_tracker/Utils/expensetile.dart';
import 'package:finance_tracker/Utils/fab_shape.dart';
import 'package:finance_tracker/Widgets/action_button.dart';
import 'package:finance_tracker/Widgets/appbar.dart';
import 'package:finance_tracker/Widgets/models/expenses_list.dart';
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
      colors: [Color.fromRGBO(61, 77, 217, 1), Color.fromRGBO(23, 39, 191, 1)]);

  final textstyle =
      GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const AppBarView(),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Your expenses',
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Baseline(
                            baseline: 40,
                            baselineType: TextBaseline.alphabetic,
                            child: ShaderMask(
                                shaderCallback: (bounds) {
                                  return gradient.createShader(Rect.fromLTWH(
                                      0, 0, bounds.width, bounds.height));
                                },
                                child: Text(
                                  '₹',
                                  style: textstyle.copyWith(
                                    color: Colors
                                        .white, // Set text color to white so the gradient shows
                                  ),
                                )),
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
                          Text('allocated',
                              style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4, right: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Row(children: [
                            Text(
                              'Your Categories',
                              style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Color.fromRGBO(204, 204, 204, 1)),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(
                              Icons.add_circle_rounded,
                              size: 14,
                              color: Colors.black,
                            )
                          ]),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                'Sort By',
                                style: GoogleFonts.inter(
                                    color: const Color.fromRGBO(41, 47, 51, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                              const Icon(Icons.keyboard_arrow_down_sharp)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: ExpensesList(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
