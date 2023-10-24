part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserComplete extends UserState {
  final UserEntity userEntity;

  UserComplete({required this.userEntity});
}

final class UserError extends UserState {
  final String error;

  UserError(this.error);
}
