import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/constant/color_constant.dart';
import 'package:teklifim_gelsin_case_study/constant/padding_constant.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/model/offer_model.dart';
import 'package:teklifim_gelsin_case_study/model/offers_model.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/offers_model_extension.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home_detail/home_detail_cubit.dart';
import 'package:teklifim_gelsin_case_study/widget/appbar/appbar_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/box_container.dart';
import 'package:teklifim_gelsin_case_study/widget/cached_network_image_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/dynamic_sized_box.dart';
import 'package:teklifim_gelsin_case_study/widget/home_detail_view/apply_now_container_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/home_detail_view/credit_card_container_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/page_headline_widget.dart';

class HomeDetailView extends StatefulWidget {
  final List<CardModel>? howOldAreYouCardList;
  final List<CardModel<CardModelType>> spendingHabitsCardList;
  final List<CardModel<CardModelType>> creditCardExpectationsCardList;
  const HomeDetailView({
    super.key,
    required this.howOldAreYouCardList,
    required this.spendingHabitsCardList,
    required this.creditCardExpectationsCardList,
  });

  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  @override
  Widget build(BuildContext context) {
    final _homeDetailCubit = context.watch<HomeDetailCubit>();

    _homeDetailCubit
      ..setHowOldAreUs(widget.howOldAreYouCardList)
      ..setCardExpectations(widget.spendingHabitsCardList)
      ..setSpendingHabits(widget.creditCardExpectationsCardList)
      ..setSponsorAndActiveOffers;

    return Scaffold(
      appBar: AppbarWidget(
          onPressedAction: () => context.read<HomeDetailCubit>().a()),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: const PaddingConstants.kStandartWidgetSpacing(),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageHeadlineWidget(
                  headlineText: 'Kredi Kartları',
                ),
              ],
            ),
            Text(
              'Seninle uyumlu ${_homeDetailCubit.state.offersModel.countTotalOffers} kredi kartı var!',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            DynamicSizedBox(size: 10),
            BlocSelector<HomeDetailCubit, HomeDetailState, List<OfferModel>?>(
              selector: (state) => state.sponsorAndActiveOffers,
              builder: (context, state) {
                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state?.length ?? 0,
                  separatorBuilder: (context, index) {
                    return DynamicSizedBox(
                      size: 20,
                    );
                  },
                  itemBuilder: (context, index) {
                    bool isSponsorAndActiveOffersEmpty = state?.isEmpty ?? true;
                    if (isSponsorAndActiveOffersEmpty) const SizedBox.shrink();
                    final offer = state![index];
                    return CreditCardContainerWidget(offerModel: offer);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
