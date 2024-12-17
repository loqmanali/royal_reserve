import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/router/app_router.dart';
import 'core/style/app_theme.dart';

class RoyalReserveApp extends StatelessWidget {
  const RoyalReserveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp.router(
        routerConfig: AppRouter.router,
        title: 'King Abdulaziz Royal Reserve',
        theme: AppTheme.light().themeData,
        builder: (context, child) => Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
