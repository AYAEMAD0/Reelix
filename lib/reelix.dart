import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/domain/usecase/forget_password_usecase.dart';
import 'features/auth/domain/usecase/login_usecase.dart';
import 'features/auth/domain/usecase/login_with_google_usecase.dart';
import 'features/auth/domain/usecase/signup_usecase.dart';
import 'features/auth/presentation/cubits/forget_password/forget_password_cubit.dart';
import 'features/auth/presentation/cubits/google/google_cubit.dart';
import 'features/auth/presentation/cubits/login/login_cubit.dart';
import 'features/auth/presentation/cubits/password/password_cubit.dart';
import 'features/auth/presentation/cubits/signup/signup_cubit.dart';

class Reelix extends StatelessWidget {
  final AppRouter appRouter;
  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;
  final ForgetPasswordUsecase forgetUseCase;
  final LoginWithGoogleUsecase loginGoogleUseCase;

  const Reelix({
    super.key,
    required this.appRouter,
    required this.signupUseCase,
    required this.loginUseCase,
    required this.forgetUseCase,
    required this.loginGoogleUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => SignupCubit(signupUseCase)),
            BlocProvider(create: (_) => LoginCubit(loginUseCase)),
            BlocProvider(create: (_) => ForgetPasswordCubit(forgetUseCase)),
            BlocProvider(create: (_) => PasswordCubit()),
            BlocProvider(create: (_) => GoogleCubit(loginGoogleUseCase)),
          ],
          child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          initialRoute: Routes.onboardingRouteName,
          onGenerateRoute: appRouter.generateRoute,
        ));
      },
    );
  }
}
