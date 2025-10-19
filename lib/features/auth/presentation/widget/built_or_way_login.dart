import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/constants/app_strings.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';

class BuiltOrWayLogin extends StatelessWidget {
  const BuiltOrWayLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColor.blue,
            endIndent:10.w ,
            indent: 10.w,
            height: 30.h,
          ),
        ),
        Text(AppStrings.or.tr(), style: TextStyles.font16BlueMedium),
        Expanded(
          child: Divider(
            color: AppColor.blue,
            endIndent:10.w ,
            indent: 10.w,
            height: 30.h,
          ),
        ),
      ],
    );
  }
}
