import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, transport, leisure, work }

class Expense {
  Expense(
      {required this.amount,
      required this.title,
      required this.date,
      required this.category})
      : id = uuid.v4();

  //properties that should describe a single expense
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
