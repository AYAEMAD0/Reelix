import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/features/auth/presentation/widget/built_password.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/auth_state_handler.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../cubits/login/login_cubit.dart';
import 'built_email.dart';
import 'built_forget_password.dart';

class BuiltFormLogin extends StatefulWidget {
  const BuiltFormLogin({super.key});
  @override
  State<BuiltFormLogin> createState() => _BuiltFormLoginState();
}

class _BuiltFormLoginState extends State<BuiltFormLogin> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthStateHandler.handleAuthState<LoginCubit, LoginState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuiltEmail(emailController: emailController),
              SizedBox(height: 22.h),
              BuiltPassword(passwordController: passwordController),
              SizedBox(height: 2.h),
              BuiltForgetPassword(),
              SizedBox(height: 15.h),
              CustomButton(
                colorBackground: AppColor.blue,
                colorText: AppColor.white,
                onPressed: () {
                  //todo login
                  if (formKey.currentState!.validate()) {
                    context.read<LoginCubit>().login(
                      emailController.text,
                      passwordController.text,
                    );
                  }
                },
                child: Text(
                  AppStrings.login.tr(),
                  style: TextStyles.font20WhiteMedium,
                ),
              ),
            ],
          ),
        );
      },
      onSuccess: (context, state) {
        if (state is LoginSuccess) {
          CustomDialog.showMessage(
            context: context,
            background: AppColor.white,
            message: AppStrings.loginSuccessfully.tr(),
            styleMessage: TextStyles.font16BlackMedium,
            title: AppStrings.success.tr(),
            styleTitle: TextStyles.font18PrimaryBold,
            posActionName: AppStrings.ok.tr(),
            stylePosActionName: TextStyles.font18PrimaryBold,
            posActionClick: () {
              // todo nav into home
              debugPrint('---------------------------------------');
              debugPrint('login with email');

            },
          );
        } else if (state is LoginVerify) {
          CustomDialog.showMessage(
            context: context,
            background: AppColor.white,
            title: AppStrings.emailNotVerified.tr(),
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
