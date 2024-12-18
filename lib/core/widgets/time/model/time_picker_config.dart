import 'package:flutter/material.dart';
import 'package:royal_reserve/core/core.dart';

/// Custom time picker configuration
class TimePickerConfig {
  final Color selectedColor;
  final Color unselectedColor;
  final Color backgroundColor;
  final Color disabledColor;
  final double borderRadius;
  final EdgeInsets padding;
  final TextStyle titleStyle;
  final TextStyle timeSlotStyle;
  final TextStyle selectedTimeSlotStyle;
  final TextStyle disabledTimeSlotStyle;

  const TimePickerConfig({
    this.selectedColor = AppColors.primaryColor,
    this.unselectedColor = AppColors.grey,
    this.backgroundColor = AppColors.white,
    this.disabledColor = AppColors.grey,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.all(16.0),
    this.titleStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    this.timeSlotStyle = const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: AppColors.grey,
    ),
    this.selectedTimeSlotStyle = const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: AppColors.primaryColor,
    ),
    this.disabledTimeSlotStyle = const TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 14,
      color: AppColors.grey,
    ),
  });
}
