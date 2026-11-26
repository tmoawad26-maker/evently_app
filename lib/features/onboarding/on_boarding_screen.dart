import 'package:evently_app/features/onboarding/widgets/custom_on_boarding_body.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomOnBoardingBody(),
    );
  }
}


