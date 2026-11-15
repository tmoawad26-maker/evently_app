import 'package:evently_app/l10n/app_localizations.dart';

class AuthValidator {
  const AuthValidator(this._localizations);

  final AppLocalizations _localizations;

  String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return _localizations.emailRequired;
    if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(email)) {
      return _localizations.emailInvalid;
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return _localizations.passwordRequired;
    }
    return null;
  }
}
