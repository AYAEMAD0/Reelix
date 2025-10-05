import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/constants/app_asset.dart';
import 'package:reelix/core/routing/routes.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppAsset.popcorn, width: 130.w),
                SizedBox(height: 20.h),
                Text(
                  AppStrings.lightCameraExplore.tr(),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyles.font16WhiteMedium,
                ),
                SizedBox(height: 20.h),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.username.tr(),
                      style: TextStyles.font18WhiteMedium,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: nameController,
                      hint: AppStrings.enterUsername.tr(),
                      colorFill: AppColor.white,
                      prefixIcon: Icon(Icons.person_outline_outlined, size: 29),
                    ),
                    SizedBox(height: 22.h),
                    Text(
                      AppStrings.email.tr(),
                      style: TextStyles.font18WhiteMedium,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: emailController,
                      hint: AppStrings.enterEmail.tr(),
                      colorFill: AppColor.white,
                      prefixIcon: Icon(Icons.email_outlined, size: 29),
                    ),
                    SizedBox(height: 22.h),
                    Text(
                      AppStrings.password.tr(),
                      style: TextStyles.font18WhiteMedium,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      isPassword: true,
                      controller: passwordController,
                      hint: AppStrings.enterPassword.tr(),
                      colorFill: AppColor.white,
                      prefixIcon: Icon(Icons.lock_outline, size: 29),
                      suffixIcon: Icon(Icons.visibility, size: 29),
                    ),
                  ],
                ),

                SizedBox(height: 40.h),

                CustomButton(
                  colorBackground: AppColor.blue,
                  colorText: AppColor.white,
                  onPressed: () {
                    //todo signup
                  },

                  child: Text(
                    AppStrings.signUp.tr(),
                    style: TextStyles.font20WhiteMedium,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.haveAccount.tr(),
                      style: TextStyles.font16WhiteMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        //todo nav into login
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.loginRouteName,
                        );
                      },
                      child: Text(
                        AppStrings.login.tr(),
                        style: TextStyles.font16BlueMedium.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
