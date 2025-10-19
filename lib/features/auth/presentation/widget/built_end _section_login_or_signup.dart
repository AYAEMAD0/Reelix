import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class BuiltEndSectionLoginOrSignup extends StatelessWidget {
  const BuiltEndSectionLoginOrSignup({
    super.key,
    required this.textAccount,
    required this.textLoginOrSignup,
    required this.onPressed,
  });
  final String textAccount;
  final String textLoginOrSignup;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textAccount, style: TextStyles.font15WhiteMedium),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textLoginOrSignup,
            style: TextStyles.font16BlueMedium.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: AppColor.blue,
            ),
          ),
        ),
      ],
    );
  }
}
