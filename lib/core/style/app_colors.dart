import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_colors.freezed.dart';

@freezed
class AppColors with _$AppColors {
  const factory AppColors() = _AppColors;

  /// Primary Colors
  static const Color primaryColor = Color(0xFFF6A623);
  static const Color backgroundColor = Color(0xFFFAF2E7);
  static const Color darkTextColor = Color(0xFF5A3E36);
  static const Color lightTextColor = Color(0xFFFAF2E7);
  static const Color secondaryColor = Color(0xFFD9C1A5);

  /// Accent and Neutral Colors
  static const Color accentColor = Color(0xFFEFC94C);
  static const Color borderColor = Color(0xFFD9C1A5);
  static const Color disabledColor = Color.fromARGB(255, 135, 135, 135);

  /// Dark Theme Colors
  static const Color darkBackgroundColor = Color(0xFF3A2B2A);
  static const Color darkCardColor = Color(0xFF4F3C3C);

  /// Other Colors
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color brightBlue = Color(0xFF4A90E2);
}
