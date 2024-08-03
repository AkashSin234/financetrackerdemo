import 'package:flutter/material.dart';
import 'package:finance_tracker/Utils/expensetile.dart'; // Assuming ExpenseTile is defined in this file
import 'package:finance_tracker/Widgets/models/data.dart'; // Assuming categories is defined in this file

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(
        bottom: 12,
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ExpenseTile(category: categories[index]),
            const Divider(
              height: 25,
              color: Colors.transparent,
            ), // Adds a divider between each ExpenseTile
          ],
        );
      },
    );
  }
}
