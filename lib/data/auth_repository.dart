class AuthRepository {
  Future<void> login() async {
    // print('Attempiting Login');
    await Future.delayed(
      const Duration(seconds: 3),
    );
    // print('Logged In');
    throw Exception('Failed to login');
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String newPassword,
  }) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
  }
}
