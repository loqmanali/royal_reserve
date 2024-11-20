import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

part 'app_styles.freezed.dart';

@freezed
class AppTextStyles with _$AppTextStyles {
  const factory AppTextStyles({
    required TextStyle heading1,
    required TextStyle heading2,
    required TextStyle subtitle,
    required TextStyle bodyText,
    required TextStyle smallText,
    required TextStyle buttonText,
    required TextStyle inputText,
    required TextStyle inputLabel,
  }) = _AppTextStyles;

  static final AppTextStyles instance = AppTextStyles(
    heading1: TextStyle(
      fontSize: 28,
      fontFamily: AppFonts.instance.arabicAlternativeFontFamily,
      fontWeight: AppFonts.instance.bold,
      color: AppColors.primaryColor,
    ),
    heading2: TextStyle(
      fontSize: 24,
      fontFamily: AppFonts.instance.arabicFontFamily,
      fontWeight: AppFonts.instance.bold,
      color: AppColors.primaryColor,
    ),
    subtitle: TextStyle(
      fontSize: 18,
      fontFamily: AppFonts.instance.arabicFontFamily,
      fontWeight: AppFonts.instance.medium,
      color: AppColors.primaryColor,
    ),
    bodyText: TextStyle(
      fontSize: 16,
      fontFamily: AppFonts.instance.arabicFontFamily,
      fontWeight: AppFonts.instance.regular,
      color: AppColors.primaryColor,
    ),
    smallText: TextStyle(
      fontSize: 12,
      fontFamily: AppFonts.instance.arabicFontFamily,
      fontWeight: AppFonts.instance.light,
      color: AppColors.accentColor,
    ),
    buttonText: TextStyle(
      fontSize: 16,
      fontFamily: AppFonts.instance.arabicFontFamily,
      fontWeight: AppFonts.instance.medium,
      color: AppColors.white,
    ),
    inputText: TextStyle(
      fontSize: 16,
      fontFamily: AppFonts.instance.arabicFontFamily,
      fontWeight: AppFonts.instance.bold,
      color: AppColors.primaryColor,
    ),
    inputLabel: TextStyle(
      fontSize: 14,
      fontFamily: AppFonts.instance.arabicFontFamily,
      fontWeight: AppFonts.instance.bold,
      color: AppColors.primaryColor,
    ),
  );
}
