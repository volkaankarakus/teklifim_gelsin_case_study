import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/constant/padding_constant.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/model/offers_model.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home_detail/home_detail_cubit.dart';
import 'package:teklifim_gelsin_case_study/widget/appbar/appbar_widget.dart';
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
      ..setSpendingHabits(widget.creditCardExpectationsCardList);

    return Scaffold(
      appBar: AppbarWidget(
          onPressedAction: () => context.read<HomeDetailCubit>().a()),
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          padding: PaddingConstants.kStandartWidgetSpacing(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PageHeadlineWidget(
                    headlineText: 'Kredi Kartları',
                  ),
                ],
              ),
              Text(
                'Seninle uyumlu 41 kredi kartı var!',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              IconButton(
                  onPressed: () => context.read<HomeDetailCubit>().a(),
                  icon: const Icon(Icons.ad_units)),
              BlocSelector<HomeDetailCubit, HomeDetailState, OffersModel?>(
                selector: (state) => state.offersModel,
                builder: (context, state) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state?.sponsored_offers?.length ?? 0,
                    itemBuilder: (context, index) {
                      bool isSponsoredOffersEmpty =
                          state?.sponsored_offers?.isEmpty ?? true;
                      if (isSponsoredOffersEmpty) const SizedBox.shrink();
                      final sponsoredOffer = state!.sponsored_offers![index];
                      return Card(
                        child: Text(sponsoredOffer.card_name ?? ''),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
