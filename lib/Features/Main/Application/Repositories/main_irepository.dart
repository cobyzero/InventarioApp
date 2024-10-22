import 'package:inventarioapp/Features/Main/Application/Services/main_service.dart';
import 'package:inventarioapp/Features/Main/Domain/Entities/modules_entity.dart';
import 'package:inventarioapp/Features/Main/Domain/Repositories/main_repository.dart';

class MainIRepository implements MainRepository {
  final MainService mainService;

  MainIRepository(this.mainService);

  @override
  Future<ModulesEntity> getModules() async {
    await mainService.getModules();
    return ModulesEntity(
      idPermisos: true,
      salidas: true,
      entradas: true,
      productos: true,
      proveedores: true,
      inventario: true,
      configuracion: true,
    );
  }
}
