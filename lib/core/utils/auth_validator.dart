import 'package:evently_app/l10n/app_localizations.dart';

class AuthValidator {
  const AuthValidator(this._localizations);

  final AppLocalizations _localizations;
  static final RegExp passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*(?:\d|[^A-Za-z0-9])).{8,}$',
  );
  String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return _localizations.emailRequired;
    if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email)) {
      return _localizations.emailInvalid;
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return _localizations.nameRequired;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return _localizations.passwordRequired;
    }
    if (!passwordRegex.hasMatch(value)) {
      return _localizations.passwordInvalid;
    }
    return null;
  }

  String? validatePasswordConfirmation(String? value, String password) {
    if (value == null || value.isEmpty) {
      return _localizations.passwordConfirmationRequired;
    }
    if (value != password) {
      return _localizations.passwordConfirmationMismatch;
    }
    return null;
  }
  /// Non-empty check for the event title and description
  static String?required(String? value , String message){
    if(value == null || value.trim().isEmpty)return message;
    return null;
  }
}
