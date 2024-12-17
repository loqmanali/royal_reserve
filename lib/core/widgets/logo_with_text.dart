import 'package:flutter/material.dart';

import '../core.dart';

class LogoWithText extends StatelessWidget {
  const LogoWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedLogo(),
        Gap(10),
        AnimatedText(),
      ],
    );
  }
}
