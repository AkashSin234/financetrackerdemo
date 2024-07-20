import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '₹',
                      style: GoogleFonts.manrope(fontSize: 20),
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
                    Text(
                      '₹98,450 ',
                      style: GoogleFonts.montserrat(
                          color: Color.fromRGBO(178, 52, 255, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      'allocated',
                      style: GoogleFonts.manrope(
                          color: Colors.black, fontSize: 13),
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
    );
  }
}
