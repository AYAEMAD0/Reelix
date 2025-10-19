// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reelix/core/routing/app_router.dart';
import 'package:reelix/features/auth/data/data_sources/auth_firebase_data_source.dart';
import 'package:reelix/features/auth/data/repo_impl/auth_repo_impl.dart';
import 'package:reelix/features/auth/domain/usecase/forget_password_usecase.dart';
import 'package:reelix/features/auth/domain/usecase/login_usecase.dart';
import 'package:reelix/features/auth/domain/usecase/login_with_google_usecase.dart';
import 'package:reelix/features/auth/domain/usecase/signup_usecase.dart';
import 'package:reelix/reelix.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame
    final dataSource = AuthFirebaseDataSource(
      firebaseAuth: FirebaseAuth.instance,
      googleSignIn: GoogleSignIn(),
    );
    final repository = AuthRepositoryImpl(dataSource);
    final signupUseCase = SignupUseCase(repository);
    final loginUseCase = LoginUseCase(repository);
    final forgetUseCase = ForgetPasswordUsecase(repository);
    final loginGoogleUseCase = LoginWithGoogleUsecase(repository);
    await tester.pumpWidget(
      Reelix(
        appRouter: AppRouter(),
        signupUseCase: signupUseCase,
        loginUseCase: loginUseCase,
        forgetUseCase: forgetUseCase,
        loginGoogleUseCase: loginGoogleUseCase,
      ),
    );
    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
