import 'package:inventarioapp/Core/Exceptions/mapping_exception.dart';
import 'package:inventarioapp/Features/Auth/Application/Services/auth_service.dart';
import 'package:inventarioapp/Features/Auth/Domain/Repositories/auth_repository.dart';

class AuthIRepository extends AuthRepository {
  final AuthService service;

  AuthIRepository(this.service);

  @override
  Future<String> login(String username, String password) async {
    try {
      await service.login(username, password);
      return "Inicio correctamente";
    } catch (e) {
      throw MappingException();
    }
  }
}
