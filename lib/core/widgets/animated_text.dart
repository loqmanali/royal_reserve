import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../style/app_colors.dart';
import '../style/app_styles.dart';

class AnimatedText extends StatelessWidget {
  const AnimatedText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextLine(text: 'محمية الملك عبدالعزيز الملكية'),
        AnimatedTextLine(text: 'King Abdulaziz Royal Reserve'),
      ],
    );
  }
}

class AnimatedTextLine extends StatelessWidget {
  final String text;

  const AnimatedTextLine({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      totalRepeatCount: 1,
      animatedTexts: [
        TypewriterAnimatedText(
          text,
          textStyle: AppTextStyles.instance.subtitle.copyWith(
            color: AppColors.white,
          ),
          cursor: '',
        ),
      ],
    );
  }
}
