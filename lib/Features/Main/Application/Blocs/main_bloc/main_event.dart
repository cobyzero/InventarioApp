part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

class MainEventModifyMenuStatus extends MainEvent {
  final MainMenuStatus status;

  MainEventModifyMenuStatus(this.status);
}
