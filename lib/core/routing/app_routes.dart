import 'package:evently_app/core/routing/routes.dart';
import 'package:evently_app/features/auth/screens/forgot_password_screen.dart';
import 'package:evently_app/features/auth/screens/login_screen.dart';
import 'package:evently_app/features/auth/screens/register_screen.dart';
import 'package:evently_app/features/main_layout/screens/main_layout.dart';
import 'package:evently_app/features/onboarding/on_boarding_screen.dart';
import 'package:evently_app/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../features/splash/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RouteName.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case RouteName.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteName.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordScreen());
      case RouteName.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case RouteName.mainLayoutRoute:
        return MaterialPageRoute(builder: (_) => MainLayout());
      case RouteName.profileRoute:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for \${settings.name}')),
          ),
        );
    }
  }
}
