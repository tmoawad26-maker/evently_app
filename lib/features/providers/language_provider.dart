import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier{
  /// state
  String lang  = 'en';
  /// method that changed state
   void changeLanguage(String languageCode) {
      if (languageCode != 'en' && languageCode != 'ar') return;
      if (lang == languageCode) return;
      lang = languageCode;
      notifyListeners();
    }
    /// handle translation of text in light theme and dark theme
    //   changeTextTheme(BuildContext context , String textTheme){
    //
    //   }
}
