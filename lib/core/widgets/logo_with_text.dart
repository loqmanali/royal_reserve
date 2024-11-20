import 'package:flutter/material.dart';

import 'animated_logo.dart';
import 'animated_text.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedLogo(),
        SizedBox(width: 10),
        AnimatedText(),
      ],
    );
  }
}
