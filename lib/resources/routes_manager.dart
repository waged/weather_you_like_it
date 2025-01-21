import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_you_like_it/presentation/home_view.dart';
import 'package:weather_you_like_it/presentation/onboarding_view.dart';
import 'package:weather_you_like_it/presentation/settings_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class RoutesManager {
  final bool isOnBoarding;

  RoutesManager({
    required this.isOnBoarding,
  });

  late final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: !isOnBoarding ? '/on_boarding' : '/home',
    routes: [
      GoRoute(
        path: '/on_boarding',
        name: 'on_boarding',
        builder: (context, state) => OnboardingView(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => SettingsView(),
      ),
    ],
  );
}
