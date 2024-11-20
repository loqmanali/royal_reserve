import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      width: 100,
      height: 100,
    ).animate().slideX(
          duration: const Duration(milliseconds: 1000),
          begin: 100,
          curve: Curves.easeInOut,
        );
  }
}
