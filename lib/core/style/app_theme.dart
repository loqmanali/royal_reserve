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
    final colorScheme = MaterialTheme.lightScheme();
    final themeData = ThemeData(
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      useMaterial3: true,
      colorScheme: colorScheme,
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
          backgroundColor: AppColors.primaryContainer,
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
    final colorScheme = MaterialTheme.darkScheme();
    final themeData = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        titleTextStyle: AppTextStyles.instance.heading2.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.secondary,
      ),
      textTheme: TextTheme(
        displayLarge: AppTextStyles.instance.heading1,
        displayMedium: AppTextStyles.instance.heading2,
        titleMedium: AppTextStyles.instance.subtitle,
        bodyLarge: AppTextStyles.instance.bodyText,
        bodyMedium: AppTextStyles.instance.smallText,
      ).apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainer,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
        labelStyle: AppTextStyles.instance.inputLabel,
        hintStyle: AppTextStyles.instance.smallText.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          textStyle: AppTextStyles.instance.buttonText,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
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

class MaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      surfaceTint: AppColors.primaryColor,
      onPrimary: AppColors.lightTextColor,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.onPrimaryContainer,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.lightTextColor,
      secondaryContainer: AppColors.secondaryContainer,
      onSecondaryContainer: AppColors.onSecondaryContainer,
      tertiary: AppColors.tertiaryColor,
      onTertiary: AppColors.lightTextColor,
      tertiaryContainer: AppColors.tertiaryContainer,
      onTertiaryContainer: AppColors.onTertiaryContainer,
      error: AppColors.errorColor,
      onError: AppColors.lightTextColor,
      errorContainer: AppColors.errorContainer,
      onErrorContainer: AppColors.onErrorContainer,
      surface: AppColors.backgroundColor,
      onSurface: AppColors.darkTextColor,
      onSurfaceVariant: AppColors.darkTextColor,
      outline: AppColors.outlineColor,
      outlineVariant: AppColors.outlineVariant,
      shadow: AppColors.shadowColor,
      scrim: AppColors.scrimColor,
      inverseSurface: AppColors.darkBackgroundColor,
      inversePrimary: AppColors.primaryContainer,
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryContainer,
      surfaceTint: AppColors.primaryContainer,
      onPrimary: AppColors.onPrimaryContainer,
      primaryContainer: AppColors.primaryColor,
      onPrimaryContainer: AppColors.darkTextColor,
      secondary: AppColors.secondaryContainer,
      onSecondary: AppColors.onSecondaryContainer,
      secondaryContainer: AppColors.secondaryColor,
      onSecondaryContainer: AppColors.lightTextColor,
      tertiary: AppColors.tertiaryContainer,
      onTertiary: AppColors.onTertiaryContainer,
      tertiaryContainer: AppColors.tertiaryColor,
      onTertiaryContainer: AppColors.darkTextColor,
      error: AppColors.errorContainer,
      onError: AppColors.onErrorContainer,
      errorContainer: AppColors.errorColor,
      onErrorContainer: AppColors.lightTextColor,
      surface: AppColors.darkBackgroundColor,
      onSurface: AppColors.lightTextColor,
      onSurfaceVariant: AppColors.lightTextColor,
      outline: AppColors.outlineColor,
      outlineVariant: AppColors.outlineVariant,
      shadow: AppColors.shadowColor,
      scrim: AppColors.scrimColor,
      inverseSurface: AppColors.backgroundColor,
      inversePrimary: AppColors.primaryColor,
    );
  }
}
