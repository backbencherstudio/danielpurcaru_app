import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageNotifier extends StateNotifier<String> {
  LanguageNotifier() : super("Eng"); // Default is obfuscated


  void updateLanguage({required String language}) {
    if(language == "English" || language == "Eng"){
      state = "Eng";
    }
    else if(language == "Portugal" || language == "Por"){
      state = "Por";
    }
    else{
      state = "Spa";
    }

  }
}

final languageProvider = StateNotifierProvider<LanguageNotifier, String>((ref) {
  return LanguageNotifier();
});
