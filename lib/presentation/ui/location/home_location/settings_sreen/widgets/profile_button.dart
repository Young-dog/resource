import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../app/app.dart';
import '../../../../../../domain/domain.dart';
import '../../../../../presentation.dart';

class ProfileButton extends StatefulWidget {
  const ProfileButton({
    super.key,
  });

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  var _userProfile = GetIt.instance<UserProfileBloc>().state.userProfile;

  @override
  void initState() {
    GetIt.instance<UserProfileRepositories>()
        .userProfileChanges
        .listen((event) {
      _userProfile = event;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        context.router.push(const EditProfileRoute());
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: theme.spacings.x2,
          horizontal: theme.spacings.x2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            theme.radiuses.x4,
          ),
          color: theme.palette.textSecondary.withOpacity(0.5),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(
                theme.radiuses.x10,
              ),
              child: Container(
                height: theme.spacings.x15,
                width: theme.spacings.x15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.palette.bgPrimary,
                ),
                child: _userProfile.avatarUri == null ||
                        _userProfile.avatarUri!.isEmpty
                    ? Center(
                        child: SizedBox(
                          height: theme.spacings.x20,
                          width: theme.spacings.x20,
                          child: SvgPicture.asset(
                            AssetNames.userAvatar,
                            color: theme.palette.iconSecondary,
                          ),
                        ),
                      )
                    : FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Image.asset(
                          _userProfile.avatarUri!,
                        ),
                      ),
              ),
            ),
            SizedBox(
              width: theme.spacings.x6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _userProfile.username ?? '',
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
                Text(
                  _userProfile.email ?? '',
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Icon(
              Icons.navigate_next,
              color: theme.palette.iconPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
