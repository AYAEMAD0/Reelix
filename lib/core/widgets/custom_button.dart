import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/theme/app_colors.dart';

import '../theme/app_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.colorBackground,
    this.text,
    this.colorText = Colors.white,
    required this.onPressed,
    this.isIcon = false,
    this.child,
    this.icon,
    this.colorBorder,
  });

  final Color colorBackground;
  final Color colorText;
  final Color? colorBorder;
  final String? text;
  final void Function()? onPressed;
  final bool isIcon;
  final Widget? child;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(color: colorBorder??AppColor.transparent)
        ),
        minimumSize: Size(double.infinity, 50),
      ),
      child:
          child ??
          (isIcon
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ?? SizedBox.shrink(),
                    SizedBox(width: 10.w),
                    Text(
                      text ?? '',
                      style: TextStyles.font20BlueMedium,
                    ),
                  ],
                )
              : Text(
                  text ?? '',
                  style:  TextStyles.font20BlueMedium,
                )),
    );
  }
}
