import 'package:bloc/bloc.dart';
import 'package:inventarioapp/Features/Auth/Domain/Repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository;

  LoginBloc(this.repository) : super(LoginInitial()) {
    on<LoginEventLoginIn>((event, emit) async {
      try {
        await repository.login(
          event.username,
          event.password,
        );

        emit(LoginAuthenticate());
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    });
  }
}
