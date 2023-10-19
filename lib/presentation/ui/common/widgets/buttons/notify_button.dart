import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app/app.dart';
import '../../../../presentation.dart';

class NotifyButton extends StatelessWidget {
  const NotifyButton({
    required this.isNotify,
    required this.onChange,
    required this.recurring,
    required this.onTimerDurationChanged,
    required this.time,
    super.key,
  });

  final DateTime? isNotify;
  final void Function(DateTime? value) onChange;
  final List<int> recurring;
  final void Function(Duration?) onTimerDurationChanged;
  final Duration? time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () {
        // onChange(!isNotify);
        if (recurring.isEmpty) {
          _selectDateTime(
            context,
            isNotify,
          );
        } else {
          _selectTime(
            context,
          );
        }
      },
      icon: Icon(
        Icons.add_alert_sharp,
        color: isNotify != null || time != null
            ? theme.palette.buttonPrimary
            : null,
      ),
    );
  }

  Future<void> _selectDateTime(BuildContext ctx, DateTime? date) async {
    final theme = Theme.of(ctx);

    await showModalBottomSheet(
      backgroundColor: theme.palette.bgPrimary,
      context: ctx,
      builder: (context) {
        return BlocProvider.value(
          value: BlocProvider.of<TaskBloc>(ctx),
          child: BottomDateTimePicker(
            date: date,
            onPressedSaveDate: onChange,
          ),
        );
      },
    );
  }

  Future<void> _selectTime(
    BuildContext ctx,
  ) async {
    final theme = Theme.of(ctx);

    await showModalBottomSheet(
      backgroundColor: theme.palette.bgPrimary,
      context: ctx,
      builder: (context) {
        return BlocProvider.value(
          value: BlocProvider.of<TaskBloc>(ctx),
          child: BottomTimePicker(
            time: time,
            onTimerDurationChanged: onTimerDurationChanged,
          ),
        );
      },
    );
  }
}
