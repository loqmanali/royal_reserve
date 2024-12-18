import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reserve/core/core.dart';
import 'package:royal_reserve/features/map/screen/map_screen.dart';
import 'package:royal_reserve/features/permits/screens/beekeeping_permits_screen.dart';

import '../../features/auth/presentation/pages/sing_in_screen.dart';
import '../../features/permits/screens/alsamman_area_login.dart';
import '../../features/permits/screens/alsamman_area_login_form_screen.dart';
import '../../features/permits/screens/off_duty_work_permit.dart';
import '../../features/profile/screen/profile_screen.dart';
import '../../features/splash/pages/splash_screen.dart';
import '../../features/tickets/screen/tickets_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    routes: [
      // Home Route
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const LayoutScreen(),
        routes: [
          // Nested route for tour details
          GoRoute(
            path: 'tour-details/:id',
            builder: (context, state) {
              // final id = state.pathParameters['id'];
              // return TourDetailsScreen(id: id!);
              return const Scaffold();
            },
          ),
          GoRoute(
            path: AppRoutes.beekeepingPermits,
            name: AppRoutes.beekeepingPermits,
            builder: (context, state) => const BeekeepingPermitsScreen(),
          ),
        ],
      ),

      /// End of Home Route

      /// Splash Route
      GoRoute(
        path: AppRoutes.splash,
        name: AppRoutes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // Login Route
      GoRoute(
        name: AppRoutes.singIn,
        path: AppRoutes.singIn,
        builder: (context, state) => const SignInScreen(),
      ),

      // Map Route
      GoRoute(
        path: AppRoutes.map,
        name: AppRoutes.map,
        builder: (context, state) => const MapScreen(),
        routes: [
          GoRoute(
            path: AppRoutes.alSammanAreaLogin,
            name: AppRoutes.alSammanAreaLogin,
            builder: (context, state) => const AlSammanAreaLoginScreen(),
          ),
          GoRoute(
            path: AppRoutes.offDutyWorkPermit,
            name: AppRoutes.offDutyWorkPermit,
            builder: (context, state) => const OffDutyWorkPermitScreen(),
          ),
          GoRoute(
            path: AppRoutes.alSammanAreaLoginForm,
            name: AppRoutes.alSammanAreaLoginForm,
            builder: (context, state) => const AlSammanAreaLoginFormScreen(),
          ),
        ],
      ),

      // Ticket Route
      GoRoute(
        path: AppRoutes.tickets,
        name: AppRoutes.tickets,
        builder: (context, state) => const TicketsScreen(),
      ),

      // Profile Route
      GoRoute(
        path: AppRoutes.profile,
        name: AppRoutes.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('404 - Page Not Found'),
      ),
    ),
  );
}

class AppRoutes {
  static const String home = '/home';
  static const String splash = '/';
  static const String singIn = '/sing-in';
  static const String map = '/map';
  static const String tickets = '/tickets';
  static const String profile = '/profile';
  static const String beekeepingPermits = '/beekeeping-permits';
  static const String alSammanAreaLogin = '/al-samman-area-login';
  static const String offDutyWorkPermit = '/off-duty-work-permit';
  static const String alSammanAreaLoginForm = '/al-samman-area-login-form';
}
