import 'package:bloc/bloc.dart';
import 'package:inventarioapp/Features/Auth/Domain/Repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      final result = await _authRepository.login(event.email, event.password);
      emit(AuthResult(result));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
