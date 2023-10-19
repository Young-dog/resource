import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../presentation.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      onPressed: () {
        context.router.back();
      },
      child: Text(
        S.of(context).goBackButtonTitle,
      ),
    );
  }
}
