import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecase/forget_password_usecase.dart';
part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUsecase forgetPasswordUseCase;

  ForgetPasswordCubit(this.forgetPasswordUseCase)
      : super(ForgetPasswordInitial());

  Future<void> sendPasswordResetEmail(String email) async {
    emit(ForgetPasswordLoading());
    try {
      final message = await forgetPasswordUseCase(email: email);

      if (message.contains('Please check your inbox')) {
        emit(ForgetPasswordSuccess(message));
      } else {
        emit(ForgetPasswordFailure(message));
      }
    } catch (e) {
      emit(ForgetPasswordFailure('Unexpected error: $e'));
    }
  }
}

