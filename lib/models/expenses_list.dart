import 'package:finance_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:finance_tracker/models/data.dart';
import 'package:finance_tracker/Utils/expensetile.dart';
import 'package:finance_tracker/Utils/colorpallette.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({
    super.key,
  });
  final List<Category> categories = [
    Category(
      categoryName: "Food",
      categoryIcon: "🍟",
      categoryIconColor: ColorPallette.shared.icon1,
      amountSpent: 10470,
      remainingAmount: 150000,
      remainingAmountStatus: RemainingAmountStatus.left,
    ),
    Category(
      categoryName: "Transport",
      categoryIcon: "🚗",
      categoryIconColor: ColorPallette.shared.icon2,
      amountSpent: 43740,
      remainingAmount: 5000,
      remainingAmountStatus: RemainingAmountStatus.exceeded,
    ),
    Category(
      categoryName: "Health",
      categoryIcon: "🏋️",
      categoryIconColor: ColorPallette.shared.icon7,
      amountSpent: 2912,
      remainingAmount: 19256,
      remainingAmountStatus: RemainingAmountStatus.left,
    ),
    Category(
      categoryName: "Leisure",
      categoryIcon: "😆",
      categoryIconColor: ColorPallette.shared.icon6,
      amountSpent: 8711,
      remainingAmount: 45610,
      remainingAmountStatus: RemainingAmountStatus.left,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) => ExpenseTile(
            amountSpent: categories[index].amountSpent,
            categoryIcon: categories[index].categoryIcon,
            categoryIconColor: categories[index].categoryIconColor,
            categoryName: categories[index].categoryName,
            remainingAmount: categories[index].remainingAmount));
  }
}
