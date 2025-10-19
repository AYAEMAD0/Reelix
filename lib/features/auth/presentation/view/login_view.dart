import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/constants/app_asset.dart';
import 'package:reelix/core/constants/app_strings.dart';
import 'package:reelix/features/auth/presentation/widget/built_form_login.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_styles.dart';
import '../widget/built_end _section_login_or_signup.dart';
import '../widget/built_login_with_google.dart';
import '../widget/built_or_way_login.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(AppAsset.login, width: 150.w),
                SizedBox(height: 8.h),
                Text(
                  AppStrings.lightCameraExplore.tr(),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyles.font15WhiteMedium,
                ),
                SizedBox(height: 20.h),
                BuiltFormLogin(),
                SizedBox(height: 10.h),
                BuiltOrWayLogin(),
                SizedBox(height: 10.h),
                BuiltLoginWithGoogle(),
                SizedBox(height: 10.h),
                BuiltEndSectionLoginOrSignup(
                  textAccount: AppStrings.dontHaveAccount.tr(),
                  textLoginOrSignup: AppStrings.register.tr(),
                  onPressed: () {
                    //todo signup
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.signupRouteName,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
