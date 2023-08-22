import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/constant/padding_constant.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_how_old_are_u/card_model_type_how_old_are_u.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';
import 'package:teklifim_gelsin_case_study/widget/box_container.dart';
import 'package:teklifim_gelsin_case_study/widget/dynamic_sized_box.dart';
import 'package:teklifim_gelsin_case_study/widget/home_view/container_button_widget.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/card_model_extension.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
          padding: PaddingConstants.kStandartWidgetSpacing(),
          child: Column(
            children: [
              DynamicSizedBox(size: MediaQuery.sizeOf(context).height * 0.01),
              Text(
                'Kredi Kartı',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              DynamicSizedBox(size: MediaQuery.sizeOf(context).height * 0.02),
              BoxContainer(
                enablePadding: false,
                height: MediaQuery.sizeOf(context).height * 0.4,
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.info_outline),
                          iconSize: 27,
                        ),
                      ],
                    ),
                    Text(
                      'Kaç yaşındasın?',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    DynamicSizedBox(
                        size: MediaQuery.sizeOf(context).height * 0.02),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.3,
                        child: BlocSelector<HomeCubit, HomeState,
                            List<CardModel<CardModelType>>>(
                          selector: (state) => state.howOldAreYouCardList!,
                          builder: (context, state) {
                            return GridView.builder(
                              itemCount: state.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 5.0,
                                crossAxisSpacing: 5.0,
                                childAspectRatio: 3,
                              ),
                              itemBuilder: (context, index) {
                                CardModel<CardModelType> cardModel =
                                    state[index];
                                return BlocSelector<HomeCubit, HomeState,
                                    CardModel<CardModelType>?>(
                                  selector: (state) =>
                                      state.selectedHowOldAreUCardModel,
                                  builder: (context, state) {
                                    return InkWell(
                                      onTap: () => context
                                          .read<HomeCubit>()
                                          .changeIsSelected(
                                              cardModel: cardModel),
                                      child: ContainerButtonWidget(
                                          cardModel: cardModel as CardModel<
                                              CardModelTypeHowOldAreU>),
                                    );
                                  },
                                );
                              },
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
