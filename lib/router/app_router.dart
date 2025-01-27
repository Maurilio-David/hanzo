import 'package:flutter/material.dart';

import '../pages/pages.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute<OnboardingScreen>(
            builder: (ctx) => const OnboardingScreen());
      case '/signin':
        return MaterialPageRoute<SinginScreen>(
          builder: (ctx) => const SinginScreen(),
        );
      case '/register':
        return MaterialPageRoute<RegisterScreen>(
          builder: (ctx) => const RegisterScreen(),
        );
      case '/home':
        return MaterialPageRoute<HomeScreen>(
          builder: (ctx) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute<OnboardingScreen>(
          builder: (ctx) => const OnboardingScreen(),
        );
    }
  }
}
