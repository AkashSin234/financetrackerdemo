import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colorpallette.dart';
import 'package:finance_tracker/models/expense.dart';

class ExpenseTile extends StatelessWidget {
  final Category category;

  const ExpenseTile({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
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
              const SizedBox(height: 4),

              // Spent and Remaining Amount Row
              Row(
                children: [
                  // Spent Amount
                  Text(
                    'Spent \$${category.amountSpent}',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),

                  // Remaining Amount
                  CapsuleTextWidget(
                    text: category.remainingAmountStatus ==
                            RemainingAmountStatus.exceeded
                        ? '- \$${category.remainingAmount}'
                        : 'Left \$${category.remainingAmount}',
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
              const SizedBox(height: 6),

              // Progress Bar (Placeholder)
              LinearProgressIndicator(
                value: 10,
                backgroundColor: Colors.grey[200],
                color: ColorPallette.shared.greenCapsule,
                minHeight: 6,
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
