import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/validator_helper.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../cubits/password/password_cubit.dart';

class BuiltPassword extends StatelessWidget {
  const BuiltPassword({super.key, required this.passwordController});
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.password.tr(),
          style: TextStyles.font15WhiteMedium,
        ),
        SizedBox(height: 8.h),
        BlocBuilder<PasswordCubit, PasswordState>(
          builder: (context, state) {
            final passwordCubit = context.read<PasswordCubit>();
            return CustomTextField(
              isPassword: true,
              obscureText: state.isObscurePassword,
              onSuffixTap: passwordCubit.togglePasswordVisibility,
              controller: passwordController,
              validator: (text) => ValidatorHelper.validatePassword(text),
              hint: AppStrings.enterPassword.tr(),
              colorFill: AppColor.white,
              prefixIcon: const Icon(Icons.lock_outline, size: 29),
            );
          },
        ),
      ],
    );
  }
}
