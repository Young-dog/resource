import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app/app.dart';
import '../../../../../domain/domain.dart';
import '../../../../../generated/l10n.dart';
import '../../../../presentation.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final wh = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return SafeArea(
      child: SizedBox(
        width: wh,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacings.x6,
          ),
          child: BlocBuilder<TaskerBloc, TaskerState>(
            builder: (context, state) {
              if (state.indexes.isNotEmpty) {
                return const _ActionTasks();
              }

              // if (state.indexes.isNotEmpty) {
              //   return _ReplaceScreen(
              //   );
              // }

              return const _ReplaceScreen();
            },
          ),
        ),
      ),
    );
  }
}

class _ActionTasks extends StatelessWidget {
  const _ActionTasks();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<TaskerBloc, TaskerState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: theme.spacings.x4,
                vertical: theme.spacings.x2,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: theme.palette.bottomBarElevation,
                    offset: const Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
                borderRadius: BorderRadius.all(theme.radiuses.x8),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<TaskerBloc>().add(const FinishTaskEvent());
                    },
                    icon: Icon(
                      Icons.check,
                      color: theme.palette.buttonCheck,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<TaskerBloc>().add(const DelTasksEvent());
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      color: theme.palette.buttonAccent,
                    ),
                  ),
                  if (state.indexes.length < 2)
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: theme.palette.buttonShare,
                      ),
                    ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ReplaceScreen extends StatelessWidget {
  const _ReplaceScreen();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacings.x4,
            vertical: theme.spacings.x2,
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: theme.palette.bottomBarElevation,
                offset: const Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
            borderRadius: BorderRadius.all(theme.radiuses.x8),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  context.replaceRoute(HomeRoute(child: const TaskerScreen()));
                },
                icon: SvgPicture.asset(
                  AssetNames.tasksIcon,
                  color: theme.palette.buttonPrimary,
                  height: theme.spacings.x6,
                  width: theme.spacings.x6,
                ),
              ),
              IconButton(
                onPressed: () {
                  context
                      .replaceRoute(HomeRoute(child: const CalendarScreen()));
                },
                icon: SvgPicture.asset(
                  AssetNames.calendarIcon,
                  color: theme.palette.buttonPrimary,
                  height: theme.spacings.x6,
                  width: theme.spacings.x6,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.replaceRoute(HomeRoute(child: const ChatsScreen()));
                },
                icon: SvgPicture.asset(
                  AssetNames.chatIcon,
                  color: theme.palette.buttonPrimary,
                  height: theme.spacings.x6,
                  width: theme.spacings.x6,
                ),
              ),
              IconButton(
                onPressed: () {
                  context
                      .replaceRoute(HomeRoute(child: const SettingsScreen()));
                },
                icon: SvgPicture.asset(
                  AssetNames.settingsIcon,
                  color: theme.palette.buttonPrimary,
                  height: theme.spacings.x6,
                  width: theme.spacings.x6,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: theme.spacings.x6,
        ),
        ActionsButton(),
      ],
    );
  }
}

/*
MenuAnchor(
          style: MenuStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.transparent,
            ),
            elevation: MaterialStateProperty.all(0),
          ),
          menuChildren: HomeMenu.values
              .map(
                (e) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: theme.spacings.x6,
                    vertical: theme.spacings.x2,
                  ),
                  child: GestureDetector(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          e.toText(
                            S.of(context),
                          ),
                          style: theme.textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          width: theme.spacings.x2,
                        ),
                        Container(
                          padding: EdgeInsets.all(
                            theme.spacings.x4,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: e.color,
                          ),
                          child: SvgPicture.asset(
                            e.icon,
                            color: theme.palette.bgSecondary,
                            width: theme.spacings.x7,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          builder:
              (BuildContext context, MenuController controller, Widget? child) {
            return ClipOval(
              child: FloatingActionButton(
                onPressed: () {
                  if (controller.isOpen) {
                    controller.close();
                  } else {
                    controller.open();
                  }
                },
                backgroundColor: theme.palette.bgSecondary,
                child: const Icon(Icons.add),
              ),
            );
          },
        ),
 */
