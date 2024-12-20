// import 'package:flutter/material.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';

// import 'app_colors.dart';
// import 'app_fonts.dart';

// part 'app_styles.freezed.dart';

// @freezed
// class AppTextStyles with _$AppTextStyles {
//   const factory AppTextStyles({
//     required TextStyle heading1,
//     required TextStyle heading2,
//     required TextStyle subtitle,
//     required TextStyle bodyText,
//     required TextStyle smallText,
//     required TextStyle buttonText,
//     required TextStyle inputText,
//     required TextStyle inputLabel,
//   }) = _AppTextStyles;

//   static final AppTextStyles instance = AppTextStyles(
//     heading1: TextStyle(
//       fontSize: 28,
//       fontFamily: AppFonts.instance.arabicAlternativeFontFamily,
//       fontWeight: AppFonts.instance.bold,
//       color: AppColors.primaryContainer,
//     ),
//     heading2: TextStyle(
//       fontSize: 24,
//       fontFamily: AppFonts.instance.arabicFontFamily,
//       fontWeight: AppFonts.instance.bold,
//       color: AppColors.primaryContainer,
//     ),
//     subtitle: TextStyle(
//       fontSize: 18,
//       fontFamily: AppFonts.instance.arabicFontFamily,
//       fontWeight: AppFonts.instance.medium,
//       color: AppColors.primaryContainer,
//     ),
//     bodyText: TextStyle(
//       fontSize: 16,
//       fontFamily: AppFonts.instance.arabicFontFamily,
//       fontWeight: AppFonts.instance.regular,
//       color: AppColors.primaryContainer,
//     ),
//     smallText: TextStyle(
//       fontSize: 12,
//       fontFamily: AppFonts.instance.arabicFontFamily,
//       fontWeight: AppFonts.instance.light,
//       color: AppColors.primaryContainer,
//     ),
//     buttonText: TextStyle(
//       fontSize: 16,
//       fontFamily: AppFonts.instance.arabicFontFamily,
//       fontWeight: AppFonts.instance.medium,
//       color: AppColors.white,
//     ),
//     inputText: TextStyle(
//       fontSize: 16,
//       fontFamily: AppFonts.instance.arabicFontFamily,
//       fontWeight: AppFonts.instance.bold,
//       color: AppColors.primaryContainer,
//     ),
//     inputLabel: TextStyle(
//       fontSize: 14,
//       fontFamily: AppFonts.instance.arabicFontFamily,
//       fontWeight: AppFonts.instance.bold,
//       color: AppColors.primaryContainer,
//     ),
//   );
// }

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontFamily: AppFonts.arabicAlternativeFontFamily,
    fontWeight: AppFonts.bold,
    color: AppColors.primaryContainer,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 24,
    fontFamily: AppFonts.arabicFontFamily,
    fontWeight: AppFonts.bold,
    color: AppColors.primaryContainer,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontFamily: AppFonts.arabicFontFamily,
    fontWeight: AppFonts.semiBold,
    color: AppColors.title,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.arabicFontFamily,
    fontWeight: AppFonts.medium,
    color: AppColors.primaryContainer,
  );

  static const TextStyle smallText = TextStyle(
    fontSize: 12,
    fontFamily: AppFonts.arabicFontFamily,
    fontWeight: AppFonts.regular,
    color: AppColors.smallText,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.arabicFontFamily,
    fontWeight: AppFonts.medium,
    color: AppColors.white,
  );

  static const TextStyle inputText = TextStyle(
    fontSize: 16,
    fontFamily: AppFonts.arabicFontFamily,
    fontWeight: AppFonts.bold,
    color: AppColors.primaryContainer,
  );

  static const TextStyle inputLabel = TextStyle(
    fontSize: 14,
    fontFamily: AppFonts.arabicFontFamily,
    fontWeight: AppFonts.bold,
    color: AppColors.primaryContainer,
  );
}
