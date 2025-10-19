import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../domain/usecase/signup_usecase.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupUseCase signupUseCase;

  SignupCubit(this.signupUseCase) : super(SignupInitial());

  Future<void> signup(String email, String password) async {
    emit(SignupLoading());
    try {
      await signupUseCase(email: email, password: password);
      emit(
        SignupSuccess(
          '${AppStrings.verificationEmail.tr()} $email. ${AppStrings.verifyBeforeLogin.tr()}',
        ),
      );
    } catch (e) {
      emit(SignupError(e.toString()));
    }
  }
}
