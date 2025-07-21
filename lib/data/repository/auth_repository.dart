abstract class AuthRepository {
  Future<String> login({required String email, required String password});

  Future<void> logout();

  Future<void> forgetPassword({required String email});

  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  });
}
