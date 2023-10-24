import 'package:bloc/bloc.dart';
import 'package:inventarioapp/Features/User/Domain/Entitys/user_entity.dart';
import 'package:inventarioapp/Features/User/Domain/Repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository) : super(UserInitial()) {
    on<UserEventLoadedUser>((event, emit) async {
      try {
        final user = await repository.getUser(event.uid);

        emit(UserComplete(userEntity: user));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
