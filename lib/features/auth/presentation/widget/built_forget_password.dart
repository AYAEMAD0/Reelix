import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_styles.dart';

class BuiltForgetPassword extends StatelessWidget {
  const BuiltForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () {
          //todo nav into forget password
          Navigator.pushNamed(context, Routes.forgetRouteName);
        },
        child: Text(
          AppStrings.forgetPassword_.tr(),
          style: TextStyles.font14GrayWhiteMedium,
        ),
      ),
    );
  }
}
