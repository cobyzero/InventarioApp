import 'package:inventarioapp/Features/User/Domain/Entitys/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getUser(String uid);
}
