import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../app/app.dart';
import '../../../../../presentation.dart';
import '../widgets/widgets.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: theme.spacings.x4,
          vertical: theme.spacings.x6,
        ),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.status.isLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: theme.palette.iconSecondary,
                ),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  if (state.status.isLoadingImg)
                    GestureDetector(
                      onTap: () {
                        context.read<ProfileBloc>().add(
                              const ChangeProfileAvatarEvent(),
                            );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          theme.radiuses.x10 * 2,
                        ),
                        child: Container(
                          height: theme.spacings.x20 * 2,
                          width: theme.spacings.x20 * 2,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: theme.palette.borderSecondary,
                              width: theme.spacings.x1 / 2,
                            ),
                          ),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: theme.palette.iconSecondary,
                            ),
                          ),
                        ),
                      ),
                    )
                  else
                    ProfileAvatar(
                      avatar: state.avatarUri,
                      onChanged: () {
                        context.read<ProfileBloc>().add(
                              const ChangeProfileAvatarEvent(),
                            );
                      },
                    ),
                  SizedBox(
                    height: theme.spacings.x20,
                  ),
                  ProfileInput(
                    title: 'Имя',
                    initialValue: state.username,
                    icon: AssetNames.userAvatar,
                    onChanged: (username) {
                      context.read<ProfileBloc>().add(
                            ChangeProfileUsernameEvent(
                              username: username,
                            ),
                          );
                    },
                  ),
                  SizedBox(
                    height: theme.spacings.x8,
                  ),
                  ProfileInput(
                    title: 'email',
                    initialValue: state.email,
                    icon: AssetNames.emailIcon,
                    onChanged: (email) {
                      context.read<ProfileBloc>().add(
                            ChangeProfileEmailEvent(
                              email: email,
                            ),
                          );
                    },
                  ),
                  SizedBox(
                    height: theme.spacings.x10,
                  ),
                  AccountButton(
                    onChanged: () async {
                      await _confirmPassword(context);
                    },
                    icon: AssetNames.lockIcon,
                    title: 'Изменить пароль',
                  ),
                  if (state.status.isChanged)
                    Column(
                      children: [
                        SizedBox(
                          height: theme.spacings.x10,
                        ),
                        AccountButton(
                          onChanged: () {
                            context.read<ProfileBloc>().add(
                                  const SubmitChangesEvent(),
                                );
                          },
                          icon: AssetNames.saveIcon,
                          title: 'Сохранить',
                        ),
                      ],
                    ),
                  SizedBox(
                    height: theme.spacings.x10,
                  ),
                  AccountButton(
                    onChanged: () {
                      context.read<LogInBloc>().add(
                            DeleteAccountEvent(uid: state.uid),
                          );
                    },
                    icon: AssetNames.deleteIcon,
                    title: 'Удалить аккаунт',
                    color: theme.palette.buttonAccent,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _confirmPassword(BuildContext context) async {
    final theme = Theme.of(context);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: theme.palette.bgPrimary,
          title: Text(
            'Подтвердите пароль',
            textAlign: TextAlign.center,
          ),
          titleTextStyle: theme.textTheme.bodyMedium,
          content: PasswordInput(
            labelText: 'Пароль',
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(onPressed: () {}, child: Text(
                'Подтвердить',
                textAlign: TextAlign.center,
              ),),
            )
          ],
        );
      },
    );
  }
}
