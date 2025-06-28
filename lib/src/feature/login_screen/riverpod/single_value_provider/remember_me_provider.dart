import 'package:flutter_riverpod/flutter_riverpod.dart';

class RememberMeNotifier extends StateNotifier<bool> {
  RememberMeNotifier() : super(false); // Default is unchecked

  // Toggle the "Remember Me" checkbox
  void toggleRememberMe() {
    state = !state;
  }
}

final rememberMeProvider = StateNotifierProvider<RememberMeNotifier, bool>((
  ref,
) {
  return RememberMeNotifier();
});
