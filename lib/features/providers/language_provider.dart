import 'package:flutter/cupertino.dart';

class LanguageProvider extends ChangeNotifier{
  /// state
  String lang  = 'en';
  /// method that changed state
   void  changeLanguage() {
      lang = lang == 'en' ? 'ar' : 'en';
      notifyListeners();
    }
    /// handle translation of text in light theme and dark theme
    //   changeTextTheme(BuildContext context , String textTheme){
    //
    //   }
}