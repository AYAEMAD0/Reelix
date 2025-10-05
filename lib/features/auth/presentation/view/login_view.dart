import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/constants/app_asset.dart';
import 'package:reelix/core/constants/app_strings.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
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
                Image.asset(AppAsset.login, width: 180.w),
                SizedBox(height: 15.h),
                Text(
                  AppStrings.lightCameraExplore.tr(),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyles.font16WhiteMedium,
                ),
                SizedBox(height: 30.h),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.email.tr(),
                      style: TextStyles.font18WhiteMedium,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: emailController,
                      hint: AppStrings.enterEmail.tr(),
                      colorFill: AppColor.white,
                      prefixIcon: Icon(Icons.email_outlined, size: 25),
                    ),
                    SizedBox(height: 22.h),
                    Text(
                      AppStrings.password.tr(),
                      style: TextStyles.font18WhiteMedium,
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: passwordController,
                      isPassword: true,
                      hint: AppStrings.enterPassword.tr(),
                      colorFill: AppColor.white,
                      prefixIcon: Icon(Icons.lock_outline, size: 25),
                      suffixIcon: Icon(Icons.visibility, size: 25),
                    ),
                  ],
                ),

                SizedBox(height: 2.h),
                Align(
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
                ),
                SizedBox(height: 20.h),

                CustomButton(
                  colorBackground: AppColor.blue,
                  colorText: AppColor.white,
                  onPressed: () {
                    //todo login
                  },

                  child: Text(
                    AppStrings.login.tr(),
                    style: TextStyles.font20WhiteMedium,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.dontHaveAccount.tr(),
                      style: TextStyles.font16WhiteMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        //todo signup
                        Navigator.pushReplacementNamed(
                          context,
                          Routes.signupRouteName,
                        );
                      },
                      child: Text(
                        AppStrings.register.tr(),
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
