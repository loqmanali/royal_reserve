import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/style/app_theme.dart';

class RoyalReserveApp extends StatelessWidget {
  const RoyalReserveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: 'King Abdulaziz Royal Reserve',
      theme: AppTheme.light().themeData,
      darkTheme: AppTheme.dark().themeData,
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child!,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
