import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'menu_actions_event.dart';

part 'menu_actions_state.dart';

class MenuActionsBloc extends Bloc<MenuActionsEvent, MenuActionsState> {
  MenuActionsBloc() : super(const MenuActionsState.initial()) {
    on<OpenMenuEvent>(_onOpen);
    on<CloseMenuEvent>(_onClose);
  }

  void _onOpen(
    OpenMenuEvent event,
    Emitter<MenuActionsState> emit,
  ) {
    emit(
      state.copyWith(
        status: MenuActionsStatus.menuOpened,
      ),
    );
  }

  void _onClose(
    CloseMenuEvent event,
    Emitter<MenuActionsState> emit,
  ) {
    emit(
      state.copyWith(
        status: MenuActionsStatus.menuClosed,
      ),
    );
  }
}
