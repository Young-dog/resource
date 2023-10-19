import 'dart:ui';

import '../../app/app.dart';
import '../../generated/l10n.dart';

enum HomeMenu {
  goal(color: Color(0xFF06d6a0), icon: AssetNames.cupIcon),
  task(color: Color(0xFF0353a4), icon: AssetNames.todoIcon),
  event(color: Color(0xFF90e0ef), icon: AssetNames.calendarEvent);

  const HomeMenu({
    required this.icon,
    required this.color,
  });

  final String icon;

  final Color color;

  String toText(S l10n) {
    switch (this) {
      case HomeMenu.event:
        return l10n.event;
      case HomeMenu.task:
        return l10n.task;
      case HomeMenu.goal:
        return l10n.goal;
    }
  }
}
