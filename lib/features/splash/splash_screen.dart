import 'package:evently_app/features/splash/widgets/custom_splash_screen_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomSplashScreenBody(),
    );
  }
}

