import 'package:flutter/material.dart';

import '../style/app_text_styles.dart';

abstract class CustomTextStyle {
  final TextStyle? style;

  const CustomTextStyle({this.style});

  TextStyle getStyle();

  TextStyle applyStyle(TextStyle baseStyle) {
    return baseStyle.copyWith(
      color: style?.color,
      fontSize: style?.fontSize,
      fontWeight: style?.fontWeight,
      letterSpacing: style?.letterSpacing,
      wordSpacing: style?.wordSpacing,
      height: style?.height,
      fontFamily: style?.fontFamily,
      fontStyle: style?.fontStyle,
      decoration: style?.decoration,
      decorationColor: style?.decorationColor,
      decorationStyle: style?.decorationStyle,
      fontFamilyFallback: style?.fontFamilyFallback,
      background: style?.background,
      shadows: style?.shadows,
      fontFeatures: style?.fontFeatures,
      debugLabel: style?.debugLabel,
      fontVariations: style?.fontVariations,
    );
  }
}

class Heading1Style extends CustomTextStyle {
  const Heading1Style({super.style});

  @override
  TextStyle getStyle() => applyStyle(AppTextStyles.heading1);
}

class Heading2Style extends CustomTextStyle {
  const Heading2Style({super.style});

  @override
  TextStyle getStyle() => applyStyle(AppTextStyles.heading2);
}

class SubtitleStyle extends CustomTextStyle {
  const SubtitleStyle({super.style});

  @override
  TextStyle getStyle() => applyStyle(AppTextStyles.subtitle);
}

class BodyTextStyle extends CustomTextStyle {
  const BodyTextStyle({super.style});

  @override
  TextStyle getStyle() => applyStyle(AppTextStyles.bodyText);
}

class SmallTextStyle extends CustomTextStyle {
  const SmallTextStyle({super.style});

  @override
  TextStyle getStyle() => applyStyle(AppTextStyles.smallText);
}

class ButtonTextStyle extends CustomTextStyle {
  const ButtonTextStyle({super.style});

  @override
  TextStyle getStyle() => applyStyle(AppTextStyles.buttonText);
}

class InputTextStyle extends CustomTextStyle {
  const InputTextStyle({super.style});

  @override
  TextStyle getStyle() => applyStyle(AppTextStyles.inputText);
}

class InputLabelStyle extends CustomTextStyle {
  const InputLabelStyle({super.style});

  @override
  TextStyle getStyle() => applyStyle(AppTextStyles.inputLabel);
}

class CustomText extends StatelessWidget {
  final String text;
  final CustomTextStyle style;

  const CustomText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.getStyle(),
      textDirection: TextDirection.rtl,
    );
  }
}
