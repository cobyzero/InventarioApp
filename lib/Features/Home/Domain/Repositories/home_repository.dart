import 'package:inventarioapp/Features/Home/Domain/Entities/sales_data_entity.dart';
import 'package:inventarioapp/Features/Home/Domain/Entities/statistics_home_entity.dart';
import 'package:inventarioapp/Models/productosModel.dart';

abstract class HomeRepository {
  Future<StatisticsHomeEntity> getStatisticsHome();
  Future<List<SalesDataEntity>> getSalesDataEntries();
  Future<List<SalesDataEntity>> getSalesDataOutputs();
  Future<List<ProductosModel>> getProductosStockLimit();
}
