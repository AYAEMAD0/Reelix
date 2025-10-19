import 'package:easy_localization/easy_localization.dart';
import 'package:reelix/core/constants/app_strings.dart';

class ValidatorHelper{
  static String? validateName(String? text){
    if (text == null || text.trim().isEmpty) {
      return AppStrings.nameRequired.tr();
    }
    if (text.length < 3) {
      return AppStrings.nameMinLength.tr();
    }
    return null;
  }

  static String? validateEmail(String? text){
    if (text == null || text.trim().isEmpty) {
      return AppStrings.emailRequired.tr();
    }
    final bool emailValid = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(text);
    if (!emailValid) {
      return AppStrings.emailInvalid.tr();
    }
    return null;
  }
  static String? validatePassword(String? text){
    if(text==null|| text.trim().isEmpty){
      return AppStrings.passwordRequired.tr();
    }if(text.length<6){
      return AppStrings.passwordMinLength.tr();
    }
    return null;
  }
}