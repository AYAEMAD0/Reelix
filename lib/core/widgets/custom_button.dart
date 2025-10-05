import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.colorBackground,
    this.text,
    this.colorText = Colors.white,
    required this.onPressed,
    this.isIcon = false,
    this.child,
  });

  final Color colorBackground;
  final Color colorText;
  final String? text;
  final void Function()? onPressed;
  final bool isIcon;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        minimumSize: Size(double.infinity, 50),
      ),
      child: child ??
          (isIcon
              ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            //  Icon(Ionicons.logo_google, color: AppColor.blue, size: 20),
              SizedBox(width: 3.w),
              Text(
                text ?? '',
                style: TextStyle(fontSize: 16, color: colorText),
              ),
            ],
          )
              : Text(
            text ?? '',
            style: TextStyle(fontSize: 16, color: colorText),
          )),
    );
  }
}
