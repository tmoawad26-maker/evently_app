import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/features/main_layout/screens/main_layout.dart';
import 'package:evently_app/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 766),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Evently',
          routes: {
            AppRoutes.mainLayoutRoute: (context) => const MainLayout(),
            AppRoutes.splashRoute: (context) => const SplashScreen(),
          },
          initialRoute: AppRoutes.splashRoute,
      );
      }
    );
  }
}