import 'expense.dart';
import 'package:finance_tracker/Utils/colorpallette.dart';

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
