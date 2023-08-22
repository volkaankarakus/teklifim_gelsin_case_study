import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/app/app_config.dart';
import 'package:teklifim_gelsin_case_study/app/locator/locator.dart';
import 'package:teklifim_gelsin_case_study/app/router/router.dart';
import 'package:teklifim_gelsin_case_study/app/theme/theme_light.dart';
import 'package:teklifim_gelsin_case_study/utils/reset_focus.dart';
import 'package:teklifim_gelsin_case_study/view/home/home_view.dart';

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
