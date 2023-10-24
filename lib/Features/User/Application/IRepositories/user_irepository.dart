import 'package:inventarioapp/Core/Exceptions/mapping_exception.dart';
import 'package:inventarioapp/Features/User/Application/Services/user_services.dart';
import 'package:inventarioapp/Features/User/Domain/Entitys/user_entity.dart';
import 'package:inventarioapp/Features/User/Domain/Repositories/user_repository.dart';

class UserIRepository extends UserRepository {
  final UserServices services;

  UserIRepository(this.services);

  @override
  Future<UserEntity> getUser(String uid) async {
    final response = await services.getUser(uid);

    try {
      final user = UserEntity.fromJson(response.data);

      return user;
    } catch (e) {
      throw MappingException();
    }
  }
}
