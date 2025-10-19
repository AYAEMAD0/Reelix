import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/constants/app_asset.dart';
import 'package:reelix/core/constants/app_strings.dart';
import 'package:reelix/core/routing/routes.dart';
import 'package:reelix/core/theme/app_colors.dart';
import 'package:reelix/core/widgets/custom_button.dart';
import '../../../../core/theme/app_styles.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAsset.onBoarding, fit: BoxFit.cover),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.background.withValues(alpha: 0.50),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 18.h,
                  ),
                  child: Column(
                    children: [
                      Image.asset(AppAsset.popcorn, height: 160.h),
                      SizedBox(height: 10.h),
                      Text(
                        AppStrings.startWatchingNow.tr(),
                        style: TextStyles.font30DarkBlueExtraBold,
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        AppStrings.experienceLatest.tr(),
                        textAlign: TextAlign.center,
                        maxLines: 8,
                        style: TextStyles.font18WhiteMedium,
                      ),
                      SizedBox(height: 16.h),
                      CustomButton(
                        colorBackground: AppColor.background,
                        onPressed: () {
                          //todo get started
                          Navigator.pushReplacementNamed(
                            context,
                            Routes.loginRouteName,
                          );
                        },
                        child: Text(
                          AppStrings.getStarted.tr(),
                          style: TextStyles.font20DarkBlueRegular,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
