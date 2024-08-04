import 'package:flutter/material.dart';

import '../pages/pages.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute<OnboardingScreen>(
            builder: (ctx) => const OnboardingScreen());
      case '/singIn':
        return MaterialPageRoute<SinginScreen>(
          builder: (ctx) => SinginScreen(),
        );
      case '/register':
        return MaterialPageRoute<RegisterScreen>(
          builder: (ctx) => RegisterScreen(),
        );
      default:
        return MaterialPageRoute<OnboardingScreen>(
          builder: (ctx) => const OnboardingScreen(),
        );
    }
  }
}
