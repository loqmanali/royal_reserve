import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_fonts.freezed.dart';

@freezed
class AppFonts with _$AppFonts {
  const AppFonts._();

  static const AppFonts instance = AppFonts(
    /// Font Families
    arabicFontFamily: 'Cairo', // Default Arabic font
    arabicAlternativeFontFamily: 'Almarai', // Alternative Arabic font
    englishFontFamily: 'Poppins', // Default English font
    englishAlternativeFontFamily: 'Roboto', // Alternative English font

    /// Font Weights
    light: FontWeight.w300,
    regular: FontWeight.w400,
    medium: FontWeight.w500,
    semiBold: FontWeight.w600,
    bold: FontWeight.w700,
  );

  const factory AppFonts({
    /// Font Families
    @Default('Cairo') String arabicFontFamily, // Default Arabic font
    @Default('Almarai')
    String arabicAlternativeFontFamily, // Alternative Arabic font
    @Default('Poppins') String englishFontFamily, // Default English font
    @Default('Roboto')
    String englishAlternativeFontFamily, // Alternative English font

    /// Font Weights
    @Default(FontWeight.w300) FontWeight light,
    @Default(FontWeight.w400) FontWeight regular,
    @Default(FontWeight.w500) FontWeight medium,
    @Default(FontWeight.w600) FontWeight semiBold,
    @Default(FontWeight.w700) FontWeight bold,
  }) = _AppFonts;
}
