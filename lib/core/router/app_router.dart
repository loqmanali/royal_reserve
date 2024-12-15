import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:royal_reserve/features/home/presentation/pages/home_screen.dart';

import '../../features/auth/presentation/pages/sing_in_screen.dart';
import '../../features/splash/pages/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      // Home Route
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
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
        builder: (context, state) => const Scaffold(),
      ),

      // Ticket Route
      GoRoute(
        path: AppRoutes.tickets,
        name: AppRoutes.tickets,
        builder: (context, state) => const Scaffold(),
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
}
