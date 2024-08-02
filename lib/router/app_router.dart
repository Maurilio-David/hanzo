import 'package:flutter/material.dart';

import '../pages/pages.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute<OnboardingScreen>(
          builder: (ctx) => const OnboardingScreen(),
        );
      case '/singIn':
        return MaterialPageRoute<SinginScreen>(
          builder: (ctx) => SinginScreen(),
        );
      default:
        return MaterialPageRoute<OnboardingScreen>(
          builder: (ctx) => const OnboardingScreen(),
        );
    }
  }
}
