import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/constants/app_asset.dart';
import 'package:reelix/core/routing/routes.dart';
import 'package:reelix/features/auth/presentation/widget/built_form_signup.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_styles.dart';
import '../widget/built_end _section_login_or_signup.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
                  style: TextStyles.font15WhiteMedium,
                ),
                SizedBox(height: 20.h),
                BuiltFormSignup(),
                SizedBox(height: 10.h),
                BuiltEndSectionLoginOrSignup(
                  textAccount: AppStrings.haveAccount.tr(),
                  textLoginOrSignup: AppStrings.login.tr(),
                  onPressed: () {
                    //todo nav into login
                    Navigator.pushReplacementNamed(
                      context,
                      Routes.loginRouteName,
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
