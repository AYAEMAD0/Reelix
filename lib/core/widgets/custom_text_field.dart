import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.controller,
    required this.hint,
    this.read = false,
    this.onChange,
    required this.colorFill,
    this.isPassword = false,
    this.colorText = AppColor.background,
    this.prefixIcon,
    this.suffixIcon,
    this.onPress,
    this.colorHint= AppColor.grayLight,
  });

  final TextEditingController? controller;
  final String? hint;
  final bool read;
  final void Function(String)? onChange;
  final Color colorFill;
  final Color colorText;
  final bool isPassword;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function()? onPress;
  final Color? colorHint;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChange,
      onTap: widget.onPress,
      style: TextStyle(color: widget.colorText,fontSize: 18.sp),
      keyboardType:
      widget.isPassword ? TextInputType.visiblePassword : TextInputType.text,
      cursorColor: AppColor.blue,
      cursorWidth: 3.w,
      cursorHeight: 25.h,
      readOnly: widget.read,
      obscureText: widget.isPassword ? _obscureText : false,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyle(color: widget.colorHint, fontSize: 16.sp),
        filled: true,
        fillColor: widget.colorFill,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword
            ? IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColor.gray,
            size: 25,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        )
            : widget.suffixIcon,
        prefixIconColor: AppColor.blue,
        contentPadding:
        EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
        border: builtBorder(AppColor.grayLight.withValues(alpha:  0.10)),
        enabledBorder: builtBorder(AppColor.grayLight.withValues(alpha: 0.10)),
        focusedBorder: builtBorder(AppColor.grayLight.withValues(alpha: 0.10)),
        errorBorder: builtBorder(AppColor.red),
      ),
    );
  }

  OutlineInputBorder builtBorder(color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
