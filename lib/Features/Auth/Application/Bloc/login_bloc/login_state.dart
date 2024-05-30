part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginAuthenticate extends LoginState {
  final UserEntity user;

  LoginAuthenticate({required this.user});
}

final class LoginError extends LoginState {
  final String error;

  LoginError(this.error);
}
