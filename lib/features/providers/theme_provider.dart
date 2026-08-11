import 'package:evently_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier
{
  /// data
   var  themeMode = ThemeMode.light;
   var textThemeMode =  'Light';
  /// method to get the current theme mode
  void toggleTheme() {
    // Implementation for toggling theme
   themeMode =  themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
  changeTextMode(BuildContext context) {
    textThemeMode = themeMode == ThemeMode.light ? AppLocalizations.of(context)!.light
        : AppLocalizations.of(context)!.dark;
    notifyListeners();
  }
}