import '../repo/auth_repo.dart';

class LoginWithGoogleUsecase {
  final AuthRepository repository;

  LoginWithGoogleUsecase(this.repository);

  Future<void> call() async {
    return await repository.loginWithGoogle();
  }
}