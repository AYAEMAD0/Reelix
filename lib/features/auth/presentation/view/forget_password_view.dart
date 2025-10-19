import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reelix/core/constants/app_asset.dart';
import 'package:reelix/core/constants/app_strings.dart';
import 'package:reelix/features/auth/presentation/widget/built_email.dart';
import '../../../../core/helper/auth_state_handler.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../cubits/forget_password/forget_password_cubit.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthStateHandler.handleAuthState<
      ForgetPasswordCubit,
      ForgetPasswordState
    >(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.background,
            title: Text(
              AppStrings.forgotPassword.tr(),
              style: TextStyles.font20WhiteMedium,
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: AppColor.white),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 15.h),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(AppAsset.forget, width: 33.w),
                    SizedBox(height: 12.h),
                    BuiltEmail(emailController: emailController),
                    SizedBox(height: 30.h),
                    CustomButton(
                      colorBackground: AppColor.blue,
                      colorText: AppColor.white,
                      onPressed: () {
                        //todo reset password
                        context
                            .read<ForgetPasswordCubit>()
                            .sendPasswordResetEmail(emailController.text);
                      },
                      child: Text(
                        AppStrings.resetPassword.tr(),
                        style: TextStyles.font20WhiteMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      onSuccess: (context, state) {
        if (state is ForgetPasswordSuccess) {
          CustomDialog.showMessage(
            context: context,
            background: AppColor.white,
            title: AppStrings.success.tr(),
            styleTitle: TextStyles.font18PrimaryBold,
            message: state.message,
            styleMessage: TextStyles.font16BlackMedium,
            posActionName: AppStrings.ok.tr(),
            stylePosActionName: TextStyles.font18PrimaryBold,
            posActionClick: (){
              //todo nav into login
              Navigator.pop(context);
            }
          );
        }else if (state is ForgetPasswordFailure) {
          CustomDialog.showMessage(
            context: context,
            background: AppColor.white,
            title: AppStrings.error.tr(),
            styleTitle: TextStyles.font18PrimaryBold,
            message: state.message,
            styleMessage: TextStyles.font16BlackMedium,
            posActionName: AppStrings.ok.tr(),
            stylePosActionName: TextStyles.font18PrimaryBold,
          );
        }
      },
    );
  }
}
