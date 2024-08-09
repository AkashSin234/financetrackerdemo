import 'package:finance_tracker/Utils/fab_shape.dart';
import 'package:finance_tracker/Widgets/appbar.dart';
import 'package:finance_tracker/Widgets/keyboard.dart';
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
    colors: [Color.fromRGBO(61, 77, 217, 1), Color.fromRGBO(23, 39, 191, 1)],
  );

  final textStyle =
      GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            const SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              title: AppBarView(),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Your expenses',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Baseline(
                              baseline: 40,
                              baselineType: TextBaseline.alphabetic,
                              child: ShaderMask(
                                shaderCallback: (bounds) {
                                  return gradient.createShader(
                                    Rect.fromLTWH(
                                        0, 0, bounds.width, bounds.height),
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
                                color: Color.fromRGBO(61, 77, 217, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'allocated',
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 0),
                      child: Row(
                        children: [
                          Text(
                            'Your Categories',
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(204, 204, 204, 1),
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'Sort By',
                                  style: GoogleFonts.inter(
                                    color: const Color.fromRGBO(41, 47, 51, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const Icon(Icons.keyboard_arrow_down_sharp),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: ExpensesList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Theme(
          data: Theme.of(context).copyWith(
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent, // Disable highlight color
          ),
          child: FloatingActionButton(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,

            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomKeyboard()));
              // Define the action when the FAB is pressed
            },
            backgroundColor: Colors.transparent, // Make background transparent
            shape: const FabShape(),
            elevation: 0,
            child: const Text(
              '+',
              style: TextStyle(
                fontFamily: 'SFPro',
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
