part of 'main_bloc.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class MainLoading extends MainState {}

final class MainLoaded extends MainState {
  final ModulesEntity modulesEntity;

  MainLoaded(this.modulesEntity);
}

final class MainError extends MainState {
  final String message;

  MainError(this.message);
}
