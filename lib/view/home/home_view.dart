import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/constant/padding_constant.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';
import 'package:teklifim_gelsin_case_study/widget/dynamic_sized_box.dart';
import 'package:teklifim_gelsin_case_study/widget/home_view/card_widget.dart/card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            title: Image.asset(
              'lib/assets/home_view/img_logo.png',
              width: 200,
              fit: BoxFit.fitWidth,
            )),
        body: Padding(
          padding: const PaddingConstants.kStandartWidgetSpacing(),
          child: Column(
            children: [
              DynamicSizedBox(size: MediaQuery.sizeOf(context).height * 0.01),
              Text(
                'Kredi Kartı',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              DynamicSizedBox(size: MediaQuery.sizeOf(context).height * 0.02),
              BlocSelector<HomeCubit, HomeState, PageController>(
                selector: (state) => state.controller!,
                builder: (context, state) {
                  return HomeViewCardWidget(pageController: state);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


              // BlocSelector<HomeCubit, HomeState, OffersModel?>(
              //   selector: (state) => state.offersModel,
              //   builder: (context, state) {
              //     return ListView.builder(
              //       shrinkWrap: true,
              //       itemCount: state?.active_offers?.length ?? 0,
              //       itemBuilder: (context, index) {
              //         bool isActiveOffersEmpty =
              //             state?.active_offers?.isEmpty ?? true;
              //         if (isActiveOffersEmpty) return SizedBox.shrink();

              //         List<OfferModel>? activeOffers = state!.active_offers;
              //         return Card(
              //           child: Text(activeOffers![index].rating.toString()),
              //         );
              //       },
              //     );
              //   },
              // ),