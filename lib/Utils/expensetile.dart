import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colorpallette.dart';
import 'package:finance_tracker/Widgets/models/expense.dart';
import 'package:intl/intl.dart';

class ExpenseTile extends StatelessWidget {
  final Category category;

  const ExpenseTile({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0');

    // Format the amounts with commas
    final formattedSpentAmount = numberFormat.format(category.amountSpent);
    final formattedRemainingAmount =
        numberFormat.format(category.remainingAmount);

    return Row(
      children: [
        // Icon Container
        Container(
          height: 47,
          width: 47,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: category.categoryIconColor,
          ),
          child: Center(
            child: Text(
              category.categoryIcon,
              style: const TextStyle(fontSize: 27),
            ),
          ),
        ),

        // Spacing between icon and details
        const SizedBox(width: 10),

        // Expense Details Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Category Name
              Text(
                category.categoryName,
                style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 1),

              // Spent and Remaining Amount Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Spent Amount
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Spent ',
                          style: GoogleFonts.inter(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                        TextSpan(
                          text: '₹$formattedSpentAmount',
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Remaining Amount
                  CapsuleTextWidget(
                    text: category.remainingAmountStatus ==
                            RemainingAmountStatus.exceeded
                        ? '- ₹$formattedRemainingAmount'
                        : 'Left ₹$formattedRemainingAmount',
                    backgroundColor: category.remainingAmountStatus ==
                            RemainingAmountStatus.exceeded
                        ? ColorPallette.shared.redCapsule
                        : ColorPallette.shared.greenCapsule,
                    textColor: category.remainingAmountStatus ==
                            RemainingAmountStatus.exceeded
                        ? const Color(0xFF780000)
                        : const Color(0xFF007837),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),

              // Progress Bar (Placeholder)
              LinearProgressIndicator(
                value: 0.5,
                backgroundColor: Colors.grey[200],
                color: const Color.fromRGBO(61, 77, 217, 1),
                minHeight: 9,
                borderRadius: BorderRadius.circular(15),
              ),
            ],
          ),
        ),
      ],
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
    final parts = text.split(RegExp(r'\s+'));
    final String amount = parts.length > 1 ? parts[1] : '';

    return Container(
      height: 18,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(17.5),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: parts[0],
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.normal,
              ),
            ),
            TextSpan(
                text: amount,
                style: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
