import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_colors.dart';
import 'app_styles.dart';

part 'app_theme.freezed.dart';

@freezed
class AppTheme with _$AppTheme {
  const factory AppTheme({
    required AppColors colors,
    required AppTextStyles styles,
    required ThemeData themeData,
  }) = _AppTheme;

  factory AppTheme.light() {
    final themeData = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.darkTextColor),
        titleTextStyle: AppTextStyles.instance.heading2.copyWith(
          color: AppColors.darkTextColor,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundColor,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secondaryColor,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.instance.heading1,
        displayMedium: AppTextStyles.instance.heading2,
        titleMedium: AppTextStyles.instance.subtitle,
        bodyLarge: AppTextStyles.instance.bodyText,
        bodyMedium: AppTextStyles.instance.smallText,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primaryColor),
        ),
        labelStyle: AppTextStyles.instance.inputLabel,
        hintStyle: AppTextStyles.instance.smallText.copyWith(
          color: AppColors.disabledColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          textStyle: AppTextStyles.instance.buttonText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
        iconSize: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
    return AppTheme(
      colors: const AppColors(),
      styles: AppTextStyles(
        heading1: themeData.textTheme.displayLarge!,
        heading2: themeData.textTheme.displayMedium!,
        subtitle: themeData.textTheme.titleMedium!,
        bodyText: themeData.textTheme.bodyLarge!,
        smallText: themeData.textTheme.bodyMedium!,
        buttonText: themeData.textTheme.bodyLarge!,
        inputText: themeData.textTheme.bodyLarge!,
        inputLabel: themeData.textTheme.titleMedium!,
      ),
      themeData: themeData,
    );
  }

  factory AppTheme.dark() {
    final themeData = ThemeData.dark().copyWith(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.lightTextColor),
        titleTextStyle: AppTextStyles.instance.heading2.copyWith(
          color: AppColors.lightTextColor,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.backgroundColor,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.secondaryColor,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.instance.heading1,
        displayMedium: AppTextStyles.instance.heading2,
        titleMedium: AppTextStyles.instance.subtitle,
        bodyLarge: AppTextStyles.instance.bodyText,
        bodyMedium: AppTextStyles.instance.smallText,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: AppColors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          textStyle: AppTextStyles.instance.buttonText,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.white,
        iconSize: 24,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
    return AppTheme(
      colors: const AppColors(),
      styles: AppTextStyles(
        heading1: themeData.textTheme.displayLarge!,
        heading2: themeData.textTheme.displayMedium!,
        subtitle: themeData.textTheme.titleMedium!,
        bodyText: themeData.textTheme.bodyLarge!,
        smallText: themeData.textTheme.bodyMedium!,
        buttonText: themeData.textTheme.bodyLarge!,
        inputText: themeData.textTheme.bodyLarge!,
        inputLabel: themeData.textTheme.titleMedium!,
      ),
      themeData: themeData,
    );
  }
}
