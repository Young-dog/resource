import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../app/app.dart';

class ObscurePasswordButton extends StatelessWidget {
  const ObscurePasswordButton({
    required this.obscurePassword,
    required this.onPressed,
    super.key,
  });

  final bool obscurePassword;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: theme.spacings.x5,
      width: theme.spacings.x5,
      child: IconButton(
        icon: FaIcon(
          obscurePassword ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
          color: theme.palette.iconSecondary,
          size: theme.spacings.x5,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
