import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static const AppLocalizationsDelegate delegate = AppLocalizationsDelegate();

  late Map<String, String> _localizedStrings;

  static Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations();
    String jsonString = await _loadLocalizationJson(locale);
    localizations._localizedStrings = Map<String, String>.from(jsonDecode(jsonString));
    Intl.defaultLocale = locale.languageCode;
    return localizations;
  }

  static Future<String> _loadLocalizationJson(Locale locale) async {
    String localeString = locale.languageCode;
    return await rootBundle.loadString('assets/lang/$localeString.json');
  }

  // Fetch localized strings
  String? get(String key) {
    return _localizedStrings[key];
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode); // Add more languages if needed
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale); // Load the JSON based on the locale
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
