import 'package:flutter/material.dart';
import 'package:reelix/features/auth/presentation/view/forget_password_view.dart';
import 'package:reelix/features/auth/presentation/view/login_view.dart';
import 'package:reelix/features/auth/presentation/view/signup_view.dart';
import '../../features/onboarding/presentation/view/onboarding_view.dart';
import 'routes.dart';

class AppRouter {
   Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingRouteName:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case Routes.loginRouteName:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.signupRouteName:
        return MaterialPageRoute(builder: (_) => SignupView());
      case Routes.forgetRouteName:
        return MaterialPageRoute(builder: (_) => ForgetPasswordView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
