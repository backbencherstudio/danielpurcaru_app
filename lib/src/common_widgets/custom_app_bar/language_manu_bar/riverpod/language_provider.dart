import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super("Eng") {
    _loadSavedLanguage();
  }

  void _loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedLang = prefs.getString('language');
    if (savedLang != null) {
      state = savedLang;
    }
  }

  void updateLanguage({required String language}) async {
    final prefs = await SharedPreferences.getInstance();

    if (language == "English" || language == "Eng") {
      state = "Eng";
      prefs.setString('language', 'Eng');
    } else if (language == "Portugal" || language == "Por") {
      state = "Por";
      prefs.setString('language', 'Por');
    } else {
      state = "Spa";
      prefs.setString('language', 'Spa');
    }
  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, String>((ref) {
  return LanguageNotifier();
});

/// Maps our internal codes to Flutter locales
Locale getLocaleFromLanguage(String lang) {
  switch (lang) {
    case 'Eng':
      return const Locale('en');
    case 'Por':
      return const Locale('pt');
    case 'Spa':
      return const Locale('es');
    default:
      return const Locale('en');
  }
}
