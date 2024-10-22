part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadedState extends HomeState {
  final StatisticsHomeEntity statisticsHomeEntity;
  final List<SalesDataEntity> salesDataEntries;
  final List<SalesDataEntity> salesDataOutputs;
  final List<ProductosModel> productosStockLimit;
  HomeLoadedState({
    required this.statisticsHomeEntity,
    required this.salesDataEntries,
    required this.salesDataOutputs,
    required this.productosStockLimit,
  });
}

final class HomeErrorState extends HomeState {
  final String message;

  HomeErrorState({required this.message});
}
