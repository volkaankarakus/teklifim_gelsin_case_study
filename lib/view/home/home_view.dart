import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teklifim_gelsin_case_study/constant/color_constant.dart';
import 'package:teklifim_gelsin_case_study/constant/padding_constant.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';
import 'package:teklifim_gelsin_case_study/widget/box_container.dart';
import 'package:teklifim_gelsin_case_study/widget/dynamic_sized_box.dart';
import 'package:teklifim_gelsin_case_study/widget/home_view/container_button_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/home_view/continue_button_widget.dart';

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
          padding: PaddingConstants.kStandartWidgetSpacing(),
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

class HomeViewCardWidget extends StatelessWidget {
  final PageController pageController;
  const HomeViewCardWidget({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      enablePadding: false,
      height: MediaQuery.sizeOf(context).height * 0.45,
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
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.27,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                CardSubWidget(
                    headlineText: 'Kaç yaşındasın',
                    cardList:
                        context.watch<HomeCubit>().state.howOldAreYouCardList ??
                            []),
                CardSubWidget(
                    headlineText: 'Harcama alışkanlıkların neler?',
                    cardList: context
                            .watch<HomeCubit>()
                            .state
                            .spendingHabitsCardList ??
                        []),
                CardSubWidget(
                    headlineText: 'Kredi kartından beklentilerini sırala',
                    cardList: context
                            .watch<HomeCubit>()
                            .state
                            .creditCardExpectationsCardList ??
                        []),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: ColorConstant.kActiveDotColor(),
              dotColor: ColorConstant.kInactiveDotColor(),
            ),
          ),
          DynamicSizedBox(
            size: MediaQuery.sizeOf(context).height * 0.02,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ContinueButtonWidget(),
          )
        ],
      ),
    );
  }
}

class CardSubWidget<T extends CardModelType> extends StatefulWidget {
  final String headlineText;
  final List<CardModel<CardModelType>> cardList;
  final CardModel<CardModelType>? selectedCard;
  const CardSubWidget({
    super.key,
    required this.headlineText,
    required this.cardList,
    this.selectedCard,
  });

  @override
  State<CardSubWidget<T>> createState() => _CardSubWidgetState<T>();
}

class _CardSubWidgetState<T extends CardModelType>
    extends State<CardSubWidget<T>> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<HomeCubit>(context).initLists();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.headlineText,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        BlocSelector<HomeCubit, HomeState, int>(
          selector: (state) => state.counter ?? 1,
          builder: (context, state) {
            return DynamicSizedBox(
                size: state.isOdd
                    ? MediaQuery.sizeOf(context).height * 0.05
                    : MediaQuery.sizeOf(context).height * 0.02);
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocSelector<HomeCubit, HomeState, int>(
            selector: (state) => state.counter ?? 1,
            builder: (context, state) {
              return SizedBox(
                height: state.isOdd
                    ? MediaQuery.sizeOf(context).height * 0.15
                    : MediaQuery.sizeOf(context).height * 0.2,
                child: BlocSelector<HomeCubit, HomeState,
                    List<CardModel<CardModelType>>>(
                  selector: (state) => widget.cardList,
                  builder: (context, state) {
                    return GridView.builder(
                      itemCount: state.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                        childAspectRatio: 3,
                      ),
                      itemBuilder: (context, index) {
                        CardModel<CardModelType> cardModel = state[index];
                        return BlocSelector<HomeCubit, HomeState,
                            CardModel<CardModelType>?>(
                          selector: (state) => widget.selectedCard,
                          builder: (context, state) {
                            return ContainerButtonWidget(
                              cardModel: cardModel as CardModel<T>,
                              onTap: () => context
                                  .read<HomeCubit>()
                                  .changeIsSelected(cardModel: cardModel),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
