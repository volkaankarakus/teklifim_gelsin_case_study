import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_case_study/app/app_config.dart';
import 'package:teklifim_gelsin_case_study/app/locator/locator.dart';
import 'package:teklifim_gelsin_case_study/app/theme/theme_light.dart';

void main() {
  // ** Dependency Injection
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      routerDelegate: AppConfig.appRouter.delegate(),
      routeInformationParser: AppConfig.appRouter.defaultRouteParser(),
    );
  }
}
