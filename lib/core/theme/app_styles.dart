import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font30DarkBlueExtraBold = GoogleFonts.montserrat(
    fontSize: 30.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: AppColor.blueDark,
  );
  static TextStyle font18WhiteMedium = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.white,
  );
  static TextStyle font20DarkBlueRegular= GoogleFonts.montserrat(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.semiBold,
    color: AppColor.blueDark,
  );
  static TextStyle font20WhiteMedium = GoogleFonts.montserrat(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.white,
  );
  static TextStyle font14GrayWhiteMedium = GoogleFonts.montserrat(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color:AppColor.grayWhite,
  );
  static TextStyle font15WhiteMedium = GoogleFonts.montserrat(
    fontSize: 15.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.white,
  );
  static TextStyle font16BlueMedium = GoogleFonts.montserrat(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.blue,
  );
  static TextStyle font20BlueMedium = GoogleFonts.montserrat(
    fontSize: 20.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.blue,
  );




  static TextStyle font16BlackMedium = GoogleFonts.montserrat(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
    color: AppColor.black,
  );
  static TextStyle font18PrimaryBold = GoogleFonts.montserrat(
    fontSize: 18.sp,
    fontWeight: FontWeightHelper.bold,
    color: AppColor.blue,
  );
}
