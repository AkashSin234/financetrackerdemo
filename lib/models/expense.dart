import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../Utils/colorpallette.dart';

class Category {
  final String? id;
  final String categoryName;
  final String categoryIcon;
  final Color categoryIconColor;
  final int amountSpent;
  final int remainingAmount;
  final RemainingAmountStatus remainingAmountStatus;

  Category({
    required this.categoryName,
    required this.categoryIcon,
    required this.categoryIconColor,
    required this.amountSpent,
    required this.remainingAmount,
    required this.remainingAmountStatus,
  }) : id = Uuid().v4();
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

  Color get textColor {
    switch (this) {
      case RemainingAmountStatus.left:
        return Color(0xFF007837);
      case RemainingAmountStatus.exceeded:
        return Color(0xFF780000);
      default:
        return Colors.transparent;
    }
  }
}
