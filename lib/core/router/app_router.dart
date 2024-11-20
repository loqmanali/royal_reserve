import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/sing_in_screen.dart';
import '../../features/splash/pages/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      // Home Route
      GoRoute(
        path: '/home',
        builder: (context, state) => const Placeholder(),
        routes: [
          // Nested route for tour details
          GoRoute(
            path: 'tour-details/:id',
            builder: (context, state) {
              // final id = state.pathParameters['id'];
              // return TourDetailsScreen(id: id!);
              return const Placeholder();
            },
          ),
        ],
      ),

      /// End of Home Route

      /// Splash Route
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),

      // Login Route
      GoRoute(
        name: '/sing-in',
        path: '/sing-in',
        builder: (context, state) => const SignInScreen(),
      ),

      // Map Route
      GoRoute(
        path: '/map',
        builder: (context, state) => const Placeholder(),
      ),

      // Ticket Route
      GoRoute(
        path: '/tickets',
        builder: (context, state) => const Placeholder(),
      ),
    ],
    errorBuilder: (context, state) => const Scaffold(
      body: Center(
        child: Text('404 - Page Not Found'),
      ),
    ),
  );
}
