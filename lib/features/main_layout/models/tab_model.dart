import 'package:flutter/material.dart';
import 'package:evently_app/l10n/app_localizations.dart';

class TabModel {
  final String label;
  final Icon icon;
  TabModel({required this.label, required this.icon});
  static List<TabModel> localized(AppLocalizations localizations) => [
    TabModel(label: localizations.home, icon: const Icon(Icons.home)),
    TabModel(
      label: localizations.favourites,
      icon: const Icon(Icons.favorite),
    ),
    TabModel(
      label: localizations.profile,
      icon: const Icon(Icons.person),
    ),
  ];
}
