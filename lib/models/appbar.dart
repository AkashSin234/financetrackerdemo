import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarView extends StatefulWidget {
  const AppBarView({super.key});

  @override
  State<AppBarView> createState() => _AppBarViewState();
}

class _AppBarViewState extends State<AppBarView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 6),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'good evening',
                  style: GoogleFonts.inter(
                    color: const Color.fromRGBO(61, 77, 217, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  'Prashant',
                  style: GoogleFonts.inter(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            Expanded(child: Container()),
            const Icon(
              Icons.more_vert_outlined,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
