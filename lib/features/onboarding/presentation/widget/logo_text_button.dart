import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';

class LogoTextButton extends StatelessWidget {
  const LogoTextButton({
    super.key,
    required this.text,
    required this.imageName,
    required this.widthImage,
    required this.heightImage,
    required this.onPressed,
  });
  final String text;
  final String imageName;
  final double widthImage;
  final double heightImage;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onPressed,
      colorBackground: AppColor.white,
      child: Row(
        spacing: 10.w,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imageName, height: heightImage, width: widthImage),
          Text(text, style: TextStyles.font20DarkBlueRegular),
        ],
      ),
    );
  }
}
