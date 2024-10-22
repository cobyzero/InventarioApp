import 'package:inventarioapp/Features/Main/Domain/Entities/modules_entity.dart';

abstract class MainRepository {
  Future<ModulesEntity> getModules();
}
