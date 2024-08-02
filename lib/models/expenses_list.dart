import 'package:flutter/material.dart';
import 'package:finance_tracker/Utils/expensetile.dart';
import 'package:finance_tracker/models/data.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: categories.length,
        itemBuilder: (context, index) =>
            ExpenseTile(category: categories[index]));
  }
}
