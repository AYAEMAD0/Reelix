import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'font_weight_helper.dart';

class TextStyles {
  static TextStyle font28WhiteExtraBold = GoogleFonts.montserrat(
    fontSize: 28.sp,
    fontWeight: FontWeightHelper.extraBold,
    color: AppColor.white,
  );
}
