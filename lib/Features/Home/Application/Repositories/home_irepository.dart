import 'package:inventarioapp/Features/Home/Application/Services/home_service.dart';
import 'package:inventarioapp/Features/Home/Domain/Entities/sales_data_entity.dart';
import 'package:inventarioapp/Features/Home/Domain/Entities/statistics_home_entity.dart';
import 'package:inventarioapp/Features/Home/Domain/Repositories/home_repository.dart';
import 'package:inventarioapp/Models/productosModel.dart';

class HomeIRepository extends HomeRepository {
  final HomeService service;

  HomeIRepository(this.service);

  @override
  Future<StatisticsHomeEntity> getStatisticsHome() async {
    await service.getStatisticsHome();
    return StatisticsHomeEntity(
      entradas: 1,
      salidas: 1,
      productos: 1,
      usuarios: 1,
    );
  }

  @override
  Future<List<SalesDataEntity>> getSalesDataEntries() async {
    await service.getSalesDataEntries();
    return [
      SalesDataEntity(
        year: DateTime.now().year.toString(),
        sales: 1,
      ),
      SalesDataEntity(
        year: (DateTime.now().year - 1).toString(),
        sales: 1,
      ),
    ];
  }

  @override
  Future<List<SalesDataEntity>> getSalesDataOutputs() async {
    await service.getSalesDataOutputs();
    return [
      SalesDataEntity(
        year: DateTime.now().year.toString(),
        sales: 1,
      ),
      SalesDataEntity(
        year: (DateTime.now().year - 1).toString(),
        sales: 1,
      ),
    ];
  }

  @override
  Future<List<ProductosModel>> getProductosStockLimit() async {
    await service.getProductosStockLimit();
    return [
      ProductosModel(
        idProducto: 1,
        codigo: "123",
        descripcion: "Producto 1",
        longitud: "1",
        almacen: "Almacen 1",
        stock: 1,
      ),
      ProductosModel(
        idProducto: 2,
        codigo: "123",
        descripcion: "Producto 2",
        longitud: "1",
        almacen: "Almacen 2",
        stock: 1,
      ),
    ];
  }
}
