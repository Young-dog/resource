import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../app/app.dart';
import '../../../../presentation.dart';
import 'view/view.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
   const SignInScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);



    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacings.x4,
          ),
          child: BlocConsumer<LogInBloc, LogInState>(
            listener: (context, state) {
              if (state.status.isNotVerified) {
                context.router.push(const ReVerificationRoute());
              }
              if (state.status.isSuccess) {
                context.router.replace(HomeRoute(child: const SettingsScreen()));
              }
            },
            builder: (context, state) {
              if (state.status.isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: theme.palette.buttonPrimary,),
                );
              }

              return const SignInView();
            },
          ),
        ),
      ),
    );
  }
}
