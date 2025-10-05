import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/routing/app_router.dart';
import 'reelix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      startLocale: Locale('en'),
      child: Reelix(appRouter: AppRouter()),
    ),
  );
}
