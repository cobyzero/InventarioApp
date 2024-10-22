import 'package:bloc/bloc.dart';
import 'package:inventarioapp/Features/Main/Domain/Entities/modules_entity.dart';
import 'package:inventarioapp/Features/Main/Domain/Repositories/main_repository.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final MainRepository _mainRepository;

  MainBloc(this._mainRepository) : super(MainInitial()) {
    on<GetModulesEvent>(_onGetModules);
  }

  Future<void> _onGetModules(
      GetModulesEvent event, Emitter<MainState> emit) async {
    emit(MainLoading());
    try {
      final modulesEntity = await _mainRepository.getModules();
      emit(MainLoaded(modulesEntity));
    } catch (e) {
      emit(MainError(e.toString()));
    }
  }
}
