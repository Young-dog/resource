import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../presentation/presentation.dart';

class GlobalBlocInjector extends StatelessWidget {
  const GlobalBlocInjector({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetIt.instance<LogInBloc>(),
        ),
        BlocProvider(
          create: (context) => GetIt.instance<TaskerBloc>(),
        ),
        BlocProvider(
          create: (context) => GetIt.instance<MenuActionsBloc>(),
        ),
      ],
      child: child,
    );
  }
}
