import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/app/app_config.dart';
import 'package:teklifim_gelsin_case_study/app/locator/locator.dart';
import 'package:teklifim_gelsin_case_study/app/theme/theme_light.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home_detail/home_detail_cubit.dart';

void main() {
  // ** Dependency Injection
  setupLocator();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<HomeCubit>(
        create: (context) => HomeCubit(),
      ),
      BlocProvider<HomeDetailCubit>(
        create: (context) => HomeDetailCubit(),
      ),
    ],
    child: MyApp(),
  ));
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
