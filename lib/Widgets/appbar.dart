import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:finance_tracker/Widgets/calender.dart'; // Import the Calendar file

class AppBarView extends StatefulWidget {
  const AppBarView({super.key});

  @override
  State<AppBarView> createState() => _AppBarViewState();
}

class _AppBarViewState extends State<AppBarView> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  void _showCalendarBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Calendar(
          selectedDate: _selectedDate,
          onDateSelected: (newDate) {
            setState(() {
              _selectedDate = newDate;
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.black,
              ),
            ),
            InkWell(
              onTap: _showCalendarBottomSheet,
              splashColor: Colors.transparent,
              child: Row(
                children: [
                  Text('${DateFormat.MMMM().format(_selectedDate)}',
                      style: GoogleFonts.inter(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500)),
                  const SizedBox(width: 8),
                  const SvgIcon(
                    icon: SvgIconData('assets/chevron.down.circle.fill.svg'),
                    size: 12,
                    color: Color.fromRGBO(61, 77, 217, 1),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {},
              child: const SvgIcon(
                icon: SvgIconData(
                  'assets/pencil.circle.svg',
                ),
                color: Color.fromRGBO(61, 77, 217, 1),
                size: 19,
              ),
            )
          ],
        ),
      ),
    );
  }
}
