import 'package:flutter/material.dart';
import 'package:finance_tracker/models/data.dart';
import 'colorpallette.dart';
import 'package:google_fonts/google_fonts.dart';

class ExpenseTile extends StatelessWidget {
  final String id;
  final String categoryName;
  final String categoryIcon;
  final Color categoryIconColor;
  final int amountSpent;
  final int remainingAmount;
  final RemainingAmountStatus remainingAmountStatus;
  ExpenseTile(
      {super.key,
      required this.id,
      required this.amountSpent,
      required this.categoryIcon,
      required this.categoryIconColor,
      required this.categoryName,
      required this.remainingAmount,
      this.remainingAmountStatus = RemainingAmountStatus.left});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Stack(
            children: [
              Container(
                height: 47,
                width: 47,
                color: categoryIconColor,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Text(categoryIcon),
            ],
          ),
          Column(
            children: [
              Text(
                categoryName,
                style: GoogleFonts.inter(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text('Spent '),
                  Text(
                    '$amountSpent',
                    style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Container()),
                  Center(
                    child: CapsuleTextWidget(
                      text: 'Left $remainingAmount',
                      backgroundColor: remainingAmountStatus.capsuleColor,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              Text('Progress Bar'),
            ],
          )
        ],
      ),
    );
  }
}

class CapsuleTextWidget extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const CapsuleTextWidget({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20), // Capsule shape
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

enum RemainingAmountStatus { left, exceeded }

extension RemainingAmountStatusExtension on RemainingAmountStatus {
  Color get capsuleColor {
    switch (this) {
      case RemainingAmountStatus.left:
        return ColorPallette.shared.greenCapsule;
      case RemainingAmountStatus.exceeded:
        return ColorPallette.shared.redCapsule;
      default:
        return Colors.transparent;
    }
  }
}
