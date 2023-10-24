part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class UserEventLoadedUser extends UserEvent {
  final String uid;

  UserEventLoadedUser(this.uid);
}
