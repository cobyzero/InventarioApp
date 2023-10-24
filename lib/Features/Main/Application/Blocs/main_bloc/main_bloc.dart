import 'package:bloc/bloc.dart';
import 'package:inventarioapp/Core/Const/enums.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<MainEventModifyMenuStatus>((event, emit) {
      emit(MainState(status: event.status));
    });
  }
}
