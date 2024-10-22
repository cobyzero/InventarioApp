part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthResult extends AuthState {
  final String result;

  AuthResult(this.result);
}

final class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}
