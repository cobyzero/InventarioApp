import 'package:bloc/bloc.dart';
import 'package:inventarioapp/Features/Home/Application/Repositories/home_irepository.dart';
import 'package:inventarioapp/Features/Home/Domain/Entities/sales_data_entity.dart';
import 'package:inventarioapp/Features/Home/Domain/Entities/statistics_home_entity.dart';
import 'package:inventarioapp/Models/productosModel.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeIRepository repository;
  HomeBloc({required this.repository}) : super(HomeInitial()) {
    on<GetStatisticsHomeEvent>(_onGetStatisticsHomeEvent);
  }

  Future<void> _onGetStatisticsHomeEvent(
      GetStatisticsHomeEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      var response = await repository.getStatisticsHome();
      var responseEntries = await repository.getSalesDataEntries();
      var responseOutputs = await repository.getSalesDataOutputs();
      var responseProductosStockLimit =
          await repository.getProductosStockLimit();
      emit(HomeLoadedState(
        statisticsHomeEntity: response,
        salesDataEntries: responseEntries,
        salesDataOutputs: responseOutputs,
        productosStockLimit: responseProductosStockLimit,
      ));
    } catch (e) {
      emit(HomeErrorState(message: e.toString()));
    }
  }
}
