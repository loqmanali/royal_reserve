import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/logo_with_text.dart';
import '../widgets/background_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        GoRouter.of(context).pushReplacementNamed('/sing-in');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundImage(
        child: LogoWithText(),
      ),
    );
  }
}
