import 'package:inventarioapp/v2/data/services/auth_service.dart';
import 'package:inventarioapp/v2/domain/repositories/auth_repository.dart';

class AuthIRepository implements AuthRepository {
  final AuthService _authService;

  AuthIRepository(this._authService);

  @override
  Future<String> login(String email, String password) async {
    return await _authService.login(email, password);
  }
}
