import 'package:inventarioapp/Features/Auth/Domain/Entitys/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String username, String password);
}
