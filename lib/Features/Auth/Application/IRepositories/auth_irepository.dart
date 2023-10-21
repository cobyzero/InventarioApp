import 'package:inventarioapp/Core/Exceptions/mapping_exception.dart';
import 'package:inventarioapp/Features/Auth/Application/Services/auth_service.dart';
import 'package:inventarioapp/Features/Auth/Domain/Repositories/auth_repository.dart';
import 'package:inventarioapp/Features/Auth/Domain/Entitys/user_entity.dart';

class AuthIRepository extends AuthRepository {
  final AuthService service;

  AuthIRepository(this.service);

  @override
  Future<UserEntity> login(String username, String password) async {
    final response = await service.login(username, password);

    try {
      return UserEntity.fromJson(response.data);
    } catch (e) {
      throw MappingException();
    }
  }
}
