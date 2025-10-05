import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/constants/app_asset.dart';
import 'package:reelix/core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.background,
        title: Text(AppStrings.forgotPassword.tr(),style: TextStyles.font20WhiteMedium,),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.white),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAsset.forget, width: 33.w),
              Text(AppStrings.resetPassword.tr(), style: TextStyles.font18WhiteMedium,),
              SizedBox(height: 12.h),
              CustomTextField(
                controller: emailController,
                hint: AppStrings.enterEmail.tr(),
                colorFill: AppColor.white,
                prefixIcon: const Icon(Icons.email_outlined,size: 29,),
              ),
              SizedBox(height:40.h),
              CustomButton(
                colorBackground: AppColor.blue,
                colorText: AppColor.white,
                onPressed: (){
                  //todo reset password
                },
                child:Text(AppStrings.resetPassword.tr(),style: TextStyles.font20WhiteMedium,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
