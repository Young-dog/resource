part of 'menu_actions_bloc.dart';

enum MenuActionsStatus {
  menuOpened,
  menuClosed;

  bool get isOpened => this == menuOpened;

  bool get isClosed => this == menuClosed;
}

class MenuActionsState extends Equatable {
  const MenuActionsState({
    required this.status,
  });

  final MenuActionsStatus status;

  const MenuActionsState.initial() : status = MenuActionsStatus.menuClosed;

  MenuActionsState copyWith({
    MenuActionsStatus? status,
  }) {
    return MenuActionsState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
