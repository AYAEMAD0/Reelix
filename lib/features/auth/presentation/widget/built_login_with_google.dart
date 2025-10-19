import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/app_asset.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helper/auth_state_handler.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../cubits/google/google_cubit.dart';

class BuiltLoginWithGoogle extends StatelessWidget {
  const BuiltLoginWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthStateHandler.handleAuthState<GoogleCubit, GoogleState>(
      builder: (context, state) {
        return CustomButton(
          onPressed: () {
            //todo google logic
            context.read<GoogleCubit>().loginWithGoogle();
          },
          colorBackground: AppColor.background,
          isIcon: true,
          text: AppStrings.loginWithGoogle.tr(),
          icon: SvgPicture.asset(AppAsset.googleLogo, height: 25.h),
          colorBorder: AppColor.blue,
        );
      },
      onSuccess: (context, state) {
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
            debugPrint('login with google');
          },
        );
      },
    );
  }
}
