import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../app/app.dart';
import '../../../../../domain/domain.dart';
import '../../../../../generated/l10n.dart';
import '../../../../presentation.dart';

class ActionsButton extends StatelessWidget {
  const ActionsButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<MenuActionsBloc, MenuActionsState>(
      builder: (context, state) {
        return Transform.rotate(
          angle: state.status.isOpened ? 45 * 0.0174533 : 0,
          child: MenuAnchor(
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
            builder: (
              BuildContext context,
              MenuController controller,
              Widget? child,
            ) {
              return ClipOval(
                child: FloatingActionButton(
                  onPressed: () {
                    if (controller.isOpen) {
                      context.read<MenuActionsBloc>().add(
                            const CloseMenuEvent(),
                          );
                      controller.close();
                    } else {
                      context.read<MenuActionsBloc>().add(
                            const OpenMenuEvent(),
                          );
                      controller.open();
                    }
                  },
                  backgroundColor: theme.palette.bgSecondary,
                  child: const Icon(Icons.add),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
