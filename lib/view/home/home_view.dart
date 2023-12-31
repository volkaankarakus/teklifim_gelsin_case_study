import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/constant/padding_constant.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';
import 'package:teklifim_gelsin_case_study/widget/appbar/appbar_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/home_view/card_widget.dart/card_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/page_headline_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final _homeCubit = context.watch<HomeCubit>();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const AppbarWidget(),
      body: Padding(
        padding: const PaddingConstants.kStandartWidgetSpacing(),
        child: Column(
          children: [
            const PageHeadlineWidget(headlineText: 'Kredi Kartı'),
            BlocSelector<HomeCubit, HomeState, PageController>(
              selector: (state) => state.controller!,
              builder: (context, state) {
                return HomeViewCardWidget(pageController: state);
              },
            ),
          ],
        ),
      ),
    );
  }
}
