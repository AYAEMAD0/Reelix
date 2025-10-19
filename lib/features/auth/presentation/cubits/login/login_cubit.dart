import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_strings.dart';
import '../../../domain/usecase/login_usecase.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final user = await loginUseCase(email: email, password: password);
      if (user != null && user.emailVerified) {
        emit(LoginSuccess());
      } else if (user != null && !user.emailVerified) {
        emit(LoginVerify(AppStrings.emailVerifiedYet.tr()));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
