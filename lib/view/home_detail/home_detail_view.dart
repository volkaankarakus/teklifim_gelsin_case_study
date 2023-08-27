import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/constant/padding_constant.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/model/offer_model.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/offers_model_extension.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home_detail/home_detail_cubit.dart';
import 'package:teklifim_gelsin_case_study/widget/appbar/sliver_app_bar_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/dynamic_sized_box.dart';
import 'package:teklifim_gelsin_case_study/widget/home_detail_view/credit_card_container_widget.dart';

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
      ..setCardExpectations(widget.creditCardExpectationsCardList)
      ..setSpendingHabits(widget.spendingHabitsCardList)
      ..setSponsorAndActiveOffers;

    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          const SliverAppbarWidget(),
          SliverToBoxAdapter(
            child: SizedBox(
              child: Center(
                child: Text(
                  'Seninle uyumlu ${_homeDetailCubit.state.offersModel.countTotalOffers} kredi kartı var!',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:
                DynamicSizedBox(size: MediaQuery.sizeOf(context).height * 0.01),
          ),
          BlocSelector<HomeDetailCubit, HomeDetailState, List<OfferModel>?>(
            selector: (state) => state.sponsorAndActiveOffers,
            builder: (context, state) {
              return SliverList.separated(
                itemCount: state?.length ?? 0,
                separatorBuilder: (context, index) {
                  return DynamicSizedBox(
                    size: MediaQuery.sizeOf(context).height * 0.02,
                  );
                },
                itemBuilder: (context, index) {
                  bool isSponsorAndActiveOffersEmpty = state?.isEmpty ?? true;
                  if (isSponsorAndActiveOffersEmpty)
                    SliverToBoxAdapter(child: const SizedBox.shrink());
                  final offer = state![index];
                  return Padding(
                    padding: const PaddingConstants.kStandartWidgetSpacing(),
                    child: CreditCardContainerWidget(
                      offerModel: offer,
                      onTap: () => context
                          .read<HomeDetailCubit>()
                          .openDialogForDetails(
                              context: context, offerModel: offer),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
