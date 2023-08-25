import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:teklifim_gelsin_case_study/constant/color_constant.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';
import 'package:teklifim_gelsin_case_study/widget/box_container.dart';
import 'package:teklifim_gelsin_case_study/widget/dynamic_sized_box.dart';
import 'package:teklifim_gelsin_case_study/widget/home_view/card_widget.dart/card_sub_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/home_view/continue_button/continue_button_widget.dart';

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
                icon: const Icon(Icons.info_outline),
                iconSize: 27,
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.27,
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
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
            effect: const ExpandingDotsEffect(
              activeDotColor: ColorConstant.kActiveDotColor(),
              dotColor: ColorConstant.kInactiveDotColor(),
            ),
          ),
          DynamicSizedBox(
            size: MediaQuery.sizeOf(context).height * 0.02,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ContinueButtonWidget(),
          )
        ],
      ),
    );
  }
}
