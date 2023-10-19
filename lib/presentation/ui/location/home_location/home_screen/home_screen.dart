import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/app.dart';
import '../../../../presentation.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    this.child = const TaskerScreen(),
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final mq = MediaQuery.of(context);

    return Scaffold(
      drawer: const SideHomeMenu(),
      body: BlocBuilder<MenuActionsBloc, MenuActionsState>(
        builder: (context, state) {
          return Stack(
            children: [
              child,
              GestureDetector(
                onTap: () {
                  context.read<MenuActionsBloc>().add(
                        const CloseMenuEvent(),
                      );
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: state.status.isOpened ? mq.size.height : 0,
                  width: state.status.isOpened ? mq.size.width : 0,
                  color: theme.palette.bgPrimary.withOpacity(0.7),
                ),
              ),
              Positioned(
                bottom: theme.spacings.x3,
                child: const BottomNavBar(),
              ),
            ],
          );
        },
      ),
    );
  }
}
