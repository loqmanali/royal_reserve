import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_colors.freezed.dart';

@freezed
class AppColors with _$AppColors {
  const factory AppColors() = _AppColors;

  /// Primary Colors
  static const Color primaryColor = Color(0xFF835400);
  static const Color backgroundColor = Color(0xFFFFF8F4);
  static const Color darkTextColor = Color(0xFF211A12);
  static const Color lightTextColor = Color(0xFFFFFFFF);
  static const Color secondaryColor = Color(0xFF7A5828);
  static const Color tertiaryColor = Color(0xFF586400);

  /// Surface Colors
  static const Color surfaceBright = Color(0xFFFFF8F4);
  static const Color surfaceDim = Color(0xFFE6D8CA);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFFFF1E5);
  static const Color surfaceContainer = Color(0xFFFAEBDD);
  static const Color surfaceContainerHigh = Color(0xFFF4E6D8);
  static const Color surfaceContainerHighest = Color(0xFFEFE0D2);

  /// Container Colors
  static const Color primaryContainer = Color(0xFFF19822);
  static const Color onPrimaryContainer = Color(0xFF462B00);
  static const Color secondaryContainer = Color(0xFFFFD5A1);
  static const Color onSecondaryContainer = Color(0xFF5C3E10);
  static const Color tertiaryContainer = Color(0xFFB7CA48);
  static const Color onTertiaryContainer = Color(0xFF2E3500);

  /// Error Colors
  static const Color errorColor = Color(0xFFBA1A1A);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF410002);

  /// Outline Colors
  static const Color outlineColor = Color(0xFF857462);
  static const Color outlineVariant = Color(0xFFD7C3AE);

  /// Basic Colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color shadowColor = Color(0xFF000000);
  static const Color scrimColor = Color(0xFF000000);

  /// Other Colors
  static const Color brightBlue = Color(0xFF4A90E2);
  static const Color borderColor = Color(0xFFD7C3AE);
  static const Color disabledColor = Color.fromARGB(255, 165, 163, 163);
  static const Color darkBackgroundColor = Color(0xFF372F26);
  static const Color darkCardColor = Color(0xFF4F3C3C);
}
