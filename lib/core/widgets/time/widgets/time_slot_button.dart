import 'package:flutter/material.dart';

import '../../../core.dart';

class TimeSlotButton extends StatelessWidget {
  final TimeSlot timeSlot;
  final bool isSelected;
  final VoidCallback? onPressed;
  final TimePickerConfig config;

  const TimeSlotButton({
    super.key,
    required this.timeSlot,
    required this.isSelected,
    required this.onPressed,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(config.borderRadius),
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryContainer
              : !timeSlot.isAvailable
                  ? config.disabledColor
                  : config.backgroundColor,
          borderRadius: BorderRadius.circular(config.borderRadius),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : config.unselectedColor,
            width: isSelected ? 2 : 1,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          timeSlot.time,
          style: AppTextStyles.smallText.copyWith(
            fontWeight: FontWeight.w600,
            color: !timeSlot.isAvailable
                ? AppColors.grey
                : isSelected
                    ? AppColors.white
                    : AppColors.grey,
          ),
        ),
      ),
    );
  }
}
