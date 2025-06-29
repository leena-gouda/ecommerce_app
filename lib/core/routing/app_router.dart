
import 'package:ecommerce_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../features/home/presentation/view/homeepage.dart';
import '../../features/onboarding/presentation/views/onboarding_screen1.dart';
import '../../features/splash_screen/presentation/views/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return _createRoute(SplashScreen());
      case Routes.onboardingScreen:
        return _createRoute(OnboardingScreen());
      case Routes.homeScreen:
        return _createRoute(Homeepage());

      default:
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: Duration(milliseconds: 350),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
}