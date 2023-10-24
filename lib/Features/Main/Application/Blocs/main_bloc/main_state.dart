part of 'main_bloc.dart';

@immutable
class MainState {
  final MainMenuStatus status;

  const MainState({
    this.status = MainMenuStatus.open,
  });
}
