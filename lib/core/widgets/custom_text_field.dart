import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.hint,
    this.read = false,
    this.onChange,
    required this.colorFill,
    this.isPassword = false,
    this.obscureText = false,
    this.colorText = AppColor.background,
    this.prefixIcon,
    this.suffixIcon,
    this.onPress,
    this.onSuffixTap,
    this.colorHint = AppColor.grayLight,
    this.validator,
  });

  final TextEditingController? controller;
  final String? hint;
  final bool read;
  final void Function(String)? onChange;
  final String? Function(String?)? validator;
  final Color colorFill;
  final Color colorText;
  final bool isPassword;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onPress;
  final Function()? onSuffixTap;
  final Color? colorHint;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChange,
      onTap: onPress,
      style: TextStyle(color: colorText, fontSize: 18.sp),
      keyboardType:
      isPassword ? TextInputType.visiblePassword : TextInputType.text,
      cursorColor: AppColor.blue,
      cursorWidth: 3.w,
      cursorHeight: 25.h,
      readOnly: read,
      obscureText: isPassword ? obscureText : false,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: colorHint, fontSize: 16.sp),
        filled: true,
        fillColor: colorFill,
        prefixIconColor: AppColor.blue,
        suffixIconColor:AppColor.gray ,
        prefixIcon: prefixIcon,
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            obscureText ? Icons.visibility_off : Icons.visibility,
            size: 25,
          ),
          onPressed: onSuffixTap,
        )
            : suffixIcon,
        contentPadding:
        EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        border: builtBorder(AppColor.grayLight.withValues(alpha: 0.10)),
        enabledBorder: builtBorder(AppColor.grayLight.withValues(alpha: 0.10)),
        focusedBorder: builtBorder(AppColor.grayLight.withValues(alpha: 0.10)),
        errorBorder: builtBorder(AppColor.red),
      ),
    );
  }

  OutlineInputBorder builtBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: color),
    );
  }
}
