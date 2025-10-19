import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/repo/auth_repo.dart';
import '../data_sources/auth_firebase_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> signup({required String email, required String password}) async {
    await remoteDataSource.signupWithEmail(email, password);
  }
  @override
  Future<User?> login({required String email, required String password}) async {
    return await remoteDataSource.loginWithEmail(email,password);
  }
  @override
  Future<String> forgetPassword({required String email}) async {
    return await remoteDataSource.forgetPassword(email);
  }
  @override
  Future<void> loginWithGoogle() async {
    await remoteDataSource.loginWithGoogle();
  }
}
