import 'package:flutter/material.dart';

import '../../../core.dart';

class DayButton extends StatelessWidget {
  final DateTime date;
  final bool isCurrentMonth;
  final bool isSelected;
  final bool isInRange;
  final bool isRangeStart;
  final bool isRangeEnd;
  final VoidCallback? onPressed;

  const DayButton({
    super.key,
    required this.date,
    required this.isCurrentMonth,
    this.isSelected = false,
    this.isInRange = false,
    this.isRangeStart = false,
    this.isRangeEnd = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isSelectable = CustomDateUtils.isDateSelectable(date);

    return Container(
      margin: const EdgeInsets.all(6),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: _getBackgroundColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: isSelectable && isCurrentMonth ? onPressed : null,
        child: Text(
          date.day.toString(),
          style: AppTextStyles.smallText.copyWith(
            color: _getTextColor(isSelectable),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor() {
    if (isRangeStart || isRangeEnd) return AppColors.primaryColor;
    if (isInRange) return AppColors.primaryColor.withOpacity(0.2);
    if (isSelected) return AppColors.primaryColor;
    return Colors.transparent;
  }

  Color _getTextColor(bool isSelectable) {
    if (!isSelectable) return Colors.black26;
    if (isRangeStart || isRangeEnd || isSelected) return AppColors.white;
    if (isCurrentMonth) return Colors.black87;
    return Colors.black26;
  }
}
