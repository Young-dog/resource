part of 'menu_actions_bloc.dart';

abstract class MenuActionsEvent extends Equatable {
  const MenuActionsEvent();

  @override
  List<Object?> get props => [];
}

class OpenMenuEvent extends MenuActionsEvent {
  const OpenMenuEvent();
}

class CloseMenuEvent extends MenuActionsEvent {
  const CloseMenuEvent();
}
