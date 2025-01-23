import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_you_like_it/domain/models/city_object.dart';
import 'package:weather_you_like_it/presentation/home_main_view.dart';
import 'package:weather_you_like_it/presentation/onboarding_view.dart';
import 'package:weather_you_like_it/presentation/settings_view.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class RoutesManager {
  final bool isOnBoarding;
  final CityObject cityObject;

  RoutesManager({
    required this.isOnBoarding,
    required this.cityObject,
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
        builder: (context, state) => HomeMainView(
          cityObject: cityObject,
        ),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => SettingsView(),
      ),
    ],
  );
}
