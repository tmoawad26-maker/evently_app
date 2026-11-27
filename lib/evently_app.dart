import 'package:evently_app/core/routing/app_routes.dart';
import 'package:evently_app/core/routing/routes.dart';
import 'package:evently_app/core/theme/app_theme.dart';
import 'package:evently_app/features/providers/language_provider.dart';
import 'package:evently_app/features/providers/theme_provider.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EventlyApp extends StatelessWidget {
  const EventlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    var languageProvider = context.watch<LanguageProvider>();
    return ScreenUtilInit(
      designSize: const Size(360, 766),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale(languageProvider.lang),
        debugShowCheckedModeBanner: false,
        title: 'Evently',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeProvider.themeMode,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: RouteName.splashRoute,
      );
      }
    );
  }
}
