import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants/app_strings.dart';
import '../theme/app_colors.dart';
import '../theme/app_styles.dart';
import '../widgets/custom_dialog.dart';

class AuthStateHandler {
  static BlocConsumer<S, T> handleAuthState<S extends StateStreamable<T>, T>({
    required Widget Function(BuildContext context, T state) builder,
    required void Function(BuildContext context, T state) onSuccess,
  }) {
    return BlocConsumer<S, T>(
      listener: (context, state) {
        if (state.toString().contains('Loading')) {
          CustomDialog.showLoading(
            context: context,
            text: AppStrings.loading.tr(),
            background: AppColor.white,
            style: TextStyles.font16BlackMedium,
          );
        } else if (state.toString().contains('Success')) {
          CustomDialog.hideLoading(context: context);
          onSuccess(context, state);
        } else if (state.toString().contains('Verify')) {
          CustomDialog.hideLoading(context: context);
          String message = AppStrings.emailVerifiedYet.tr();
          try {
            final msgField = state as dynamic;
            if (msgField.message != null) {
              message = msgField.message;
            }
          } catch (_) {}
          CustomDialog.showMessage(
            context: context,
            background: AppColor.white,
            title: AppStrings.emailNotVerified.tr(),
            styleTitle: TextStyles.font18PrimaryBold,
            message: message,
            styleMessage: TextStyles.font16BlackMedium,
            posActionName: AppStrings.ok.tr(),
            stylePosActionName: TextStyles.font18PrimaryBold,
          );
        } else if (state.toString().contains('Failure') ||
            state.toString().contains('Error')) {
          CustomDialog.hideLoading(context: context);

          String message = AppStrings.error.tr();
          try {
            final msgField = state as dynamic;
            if (msgField.message != null) {
              message = msgField.message;
            }
            if (message.startsWith('Exception:')) {
              message = message.replaceFirst('Exception:', '').trim();
            }
          } catch (_) {}
          CustomDialog.showMessage(
            context: context,
            background: AppColor.white,
            message: message,
            styleMessage: TextStyles.font16BlackMedium,
            title: AppStrings.error.tr(),
            styleTitle: TextStyles.font18PrimaryBold,
            posActionName: AppStrings.ok.tr(),
            stylePosActionName: TextStyles.font18PrimaryBold,
          );
          debugPrint('---------------------------------------------');
          debugPrint(message);
          debugPrint('---------------------------------------------');
        }
      },
      builder: builder,
    );
  }
}
