import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../auth_repository_impl/auth_repository_impl.dart';

final authControllerProvider = AsyncNotifierProvider<AuthController, void>(
  () => AuthController(),
);

class AuthController extends AsyncNotifier<void> {
  late final AuthRepositoryImpl _authRepository;

  @override
  FutureOr<void> build() {
    _authRepository = ref.read(authRepositoryProvider);
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading(); // ⏳ show loading
    try {
      final route = await _authRepository.login(
        email: email,
        password: password,
      );
      return route.isNotEmpty ? route : null;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }
}

final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  return AuthRepositoryImpl();
});
