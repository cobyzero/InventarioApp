abstract class AuthRepository {
  Future<String> login(String email, String password);
}
