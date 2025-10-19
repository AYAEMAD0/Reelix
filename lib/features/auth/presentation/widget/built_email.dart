import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/validator_helper.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_text_field.dart';

class BuiltEmail extends StatelessWidget {
  const BuiltEmail({super.key, required this.emailController});
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.email.tr(), style: TextStyles.font15WhiteMedium),
        SizedBox(height: 8.h),
        CustomTextField(
          controller: emailController,
          validator: (text) => ValidatorHelper.validateEmail(text),
          hint: AppStrings.enterEmail.tr(),
          colorFill: AppColor.white,
          prefixIcon: Icon(Icons.email_outlined, size: 29),
        ),
      ],
    );
  }
}
