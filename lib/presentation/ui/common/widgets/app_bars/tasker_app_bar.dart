import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../app/app.dart';
import '../../../../../data/data.dart';
import '../../../../presentation.dart';

class TaskerAppBar extends StatefulWidget {
  const TaskerAppBar({super.key});

  @override
  State<TaskerAppBar> createState() => _TaskerAppBarState();
}

class _TaskerAppBarState extends State<TaskerAppBar> {
  late final Box<TaskRequestDto> _eventsBox;

  final _monthFormat = DateFormat.MMMM('ru_RU');

  DateTime _selectedDate = DateTime.now();

  DateTime _focusedDay = DateTime.now();

  @override
  void initState() {
    _eventsBox = Hive.box<TaskRequestDto>(HiveBoxes.tasksBox);
    _eventsBox.listenable().addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SliverAppBar(
      title: Text(
        _monthFormat.format(_focusedDay),
        style: theme.textTheme.titleSmall!.copyWith(
          color: theme.palette.textPrimary,
        ),
      ),
      pinned: true,
      snap: true,
      floating: true,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(theme.spacings.x19),
        child: TableCalendar(
          calendarBuilders: CalendarBuilders(
            markerBuilder: (
              context,
              date,
              events,
            ) {
              Widget? marker;

              if (events.isNotEmpty) {
                marker = Positioned(
                  right: 1,
                  bottom: 1,
                  child: Container(
                    padding: EdgeInsets.all(theme.spacings.x1),
                    decoration: BoxDecoration(
                      color: theme.palette.buttonShare,
                      shape: BoxShape.circle,
                    ),
                    constraints: BoxConstraints(
                      minWidth: theme.spacings.x4,
                      minHeight: theme.spacings.x4,
                    ),
                    child: Text(
                      '${events.length}',
                      style: theme.textTheme.bodySmall!.copyWith(fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }

              return marker;
            },
          ),
          eventLoader: _getTasks,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDate, day);
          },
          onDaySelected: (selectedDay, focusedDay) {
            _selectedDate = selectedDay;
            context
                .read<TaskerBloc>()
                .add(ChangeSelectedDateEvent(selectedDate: _selectedDate));
            _focusedDay = focusedDay;
            setState(() {});
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
            setState(() {});
          },
          startingDayOfWeek: StartingDayOfWeek.monday,
          headerVisible: false,
          firstDay: DateTime.utc(2023, 01, 01),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          daysOfWeekHeight: theme.spacings.x6,
          calendarFormat: CalendarFormat.week,
          calendarStyle: CalendarStyle(
            todayDecoration: const BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            todayTextStyle: theme.textTheme.bodySmall!.copyWith(
              color: theme.palette.buttonShare.withOpacity(0.7),
            ),
            selectedTextStyle: theme.textTheme.bodySmall!.copyWith(
              color: Colors.white,
            ),
            //isTodayHighlighted: false,
            defaultTextStyle: theme.textTheme.bodySmall!,
            weekendTextStyle: theme.textTheme.bodySmall!.copyWith(
              color: theme.palette.iconSecondary,
            ),
            weekNumberTextStyle: theme.textTheme.bodySmall!,
          ),
        ),
      ),
    );
  }

  List<TaskRequestDto> _getTasks(DateTime eventDay) {
    final currentEvents = _eventsBox.values.where(
      (event) =>
          ((event.dateFirst?.day == eventDay.day &&
              event.dateFirst?.month == eventDay.month &&
              event.dateFirst?.year == eventDay.year) ||
          (event.dateFirst == null &&
              (DateTime.now().day == eventDay.day &&
                  DateTime.now().month == eventDay.month &&
                  DateTime.now().year == eventDay.year))) && !event.finish,
    );
    return currentEvents.toList();
  }
}
