class AuthService {
  Future<String> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    return "token";
  }
}
