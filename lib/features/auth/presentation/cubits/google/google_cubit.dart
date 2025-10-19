import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecase/login_with_google_usecase.dart';
part 'google_state.dart';


class GoogleCubit extends Cubit<GoogleState> {
  final LoginWithGoogleUsecase loginWithGoogleUsecase;

  GoogleCubit(this.loginWithGoogleUsecase) : super(GoogleInitial());

  Future<void> loginWithGoogle() async {
    emit(GoogleLoading());
    try {
      await loginWithGoogleUsecase();
      emit(GoogleSuccess());
    } catch (e) {
      emit(GoogleFailure(e.toString()));
    }
  }
}
