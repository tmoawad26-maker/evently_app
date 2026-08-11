import 'package:evently_app/core/utils/app_routes.dart';
import 'package:evently_app/core/utils/app_theme.dart';
import 'package:evently_app/features/main_layout/screens/main_layout.dart';
import 'package:evently_app/features/profile/profile_screen.dart';
import 'package:evently_app/features/providers/language_provider.dart';
import 'package:evently_app/features/providers/theme_provider.dart';
import 'package:evently_app/features/splash/splash_screen.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    var langProvider = context.watch<LanguageProvider>();
    return ScreenUtilInit(
      designSize: const Size(360, 766),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Evently',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(langProvider.lang),
        themeMode: themeProvider.themeMode,
          routes: {
            AppRoutes.mainLayoutRoute: (context) => const MainLayout(),
            AppRoutes.splashRoute: (context) => const SplashScreen(),
            AppRoutes.profileRoute :(context) => const ProfileScreen()
          },
          initialRoute: AppRoutes.profileRoute,
      );
      }
    );
  }
}