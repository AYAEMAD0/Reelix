import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/features/auth/presentation/widget/built_email.dart';
import 'package:reelix/features/auth/presentation/widget/built_password.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/auth_state_handler.dart';
import '../../../../core/helper/validator_helper.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../cubits/signup/signup_cubit.dart';
import '../cubits/signup/signup_state.dart';

class BuiltFormSignup extends StatefulWidget {
  const BuiltFormSignup({super.key});

  @override
  State<BuiltFormSignup> createState() => _BuiltFormSignupState();
}

class _BuiltFormSignupState extends State<BuiltFormSignup> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthStateHandler.handleAuthState<SignupCubit, SignupState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.username.tr(),
                style: TextStyles.font15WhiteMedium,
              ),
              SizedBox(height: 8.h),
              CustomTextField(
                controller: nameController,
                validator: (text) => ValidatorHelper.validateName(text),
                hint: AppStrings.enterUsername.tr(),
                colorFill: AppColor.white,
                prefixIcon: Icon(Icons.person_outline_outlined, size: 29),
              ),
              SizedBox(height: 22.h),
              BuiltEmail(emailController: emailController),
              SizedBox(height: 22.h),
              BuiltPassword(passwordController: passwordController),
              SizedBox(height: 40.h),
              CustomButton(
                colorBackground: AppColor.blue,
                colorText: AppColor.white,
                onPressed: () {
                  //todo signup
                  if (formKey.currentState!.validate()) {
                    context.read<SignupCubit>().signup(
                      emailController.text,
                      passwordController.text,
                    );
                  }
                },
                child: Text(
                  AppStrings.signUp.tr(),
                  style: TextStyles.font20WhiteMedium,
                ),
              ),
            ],
          ),
        );
      },
      onSuccess: (context, state) {
        if (state is SignupSuccess) {
          CustomDialog.showMessage(
            context: context,
            background: AppColor.white,
            title: AppStrings.success.tr(),
            styleTitle: TextStyles.font18PrimaryBold,
            message: state.message,
            styleMessage: TextStyles.font16BlackMedium,
            posActionName: AppStrings.ok.tr(),
            stylePosActionName: TextStyles.font18PrimaryBold,
            posActionClick: () {
              Navigator.pushReplacementNamed(context, Routes.loginRouteName);
            },
          );
        } else if (state is SignupError) {
          CustomDialog.showMessage(
            context: context,
            background: AppColor.white,
            title: AppStrings.error.tr(),
            styleTitle: TextStyles.font18PrimaryBold,
            message: state.message,
            styleMessage: TextStyles.font16BlackMedium,
            posActionName: AppStrings.ok.tr(),
            stylePosActionName: TextStyles.font18PrimaryBold,
          );
        }
      },
    );
  }
}
