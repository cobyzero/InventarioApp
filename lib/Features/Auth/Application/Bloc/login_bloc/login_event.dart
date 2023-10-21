part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class LoginEventLoginIn extends LoginEvent {
  final String username;
  final String password;

  LoginEventLoginIn(this.username, this.password);
}
