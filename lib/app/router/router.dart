import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../data/data.dart';
import '../../presentation/presentation.dart';
import 'guards/guards.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          initial: true,
          // guards: [
          //   AuthGuard(),
          // ],
          children: [
            AutoRoute(
              //guards: [AuthGuard()],
              page: TaskerRoute.page,
            ),
            AutoRoute(
              //guards: [AuthGuard()],
              page: CalendarRoute.page,
            ),
            AutoRoute(
              //guards: [AuthGuard()],
              page: ChatsRoute.page,
            ),
            AutoRoute(
              //guards: [AuthGuard()],
              page: SettingsRoute.page,
            ),
          ],
        ),
        AutoRoute(
          page: SignInRoute.page,
        ),
        AutoRoute(
          page: SignUpRoute.page,
        ),
        AutoRoute(
          page: ResetPasswordRoute.page,
        ),
        AutoRoute(
          page: ChangePasswordRoute.page,
        ),
        AutoRoute(
          page: ReVerificationRoute.page,
        ),
        AutoRoute(
          //guards: [AuthGuard()],
          page: TaskRoute.page,
        ),
        AutoRoute(
          //guards: [AuthGuard()],
          page: EditProfileRoute.page,
        ),
      ];
}
