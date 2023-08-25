import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/model/offer_model.dart';
import 'package:teklifim_gelsin_case_study/model/offers_model.dart';
import 'package:teklifim_gelsin_case_study/request/post/create_card_post_request.dart';
import 'package:teklifim_gelsin_case_study/widget/home_detail_view/home_detail_dialog/credit_card_detail_dialog_widget.dart';

part 'home_detail_state.dart';

class HomeDetailCubit extends Cubit<HomeDetailState> {
  HomeDetailCubit() : super(HomeDetailState()) {
    Future.microtask(() => fetchData);
  }

  // ** Set Values from HomeView
  void setHowOldAreUs(List<CardModel>? cardList) {
    emit(state.copyWith(howOldAreYouCardList: cardList));
  }

  void setSpendingHabits(List<CardModel<CardModelType>>? cardList) {
    emit(state.copyWith(spendingHabitsCardList: cardList));
  }

  void setCardExpectations(List<CardModel<CardModelType>>? cardList) {
    emit(state.copyWith(creditCardExpectationsCardList: cardList));
  }

  // ** Post Request
  CreateCardPostRequest createCardPostRequest = CreateCardPostRequest();

  // ** Get Data
  Future<void> get fetchData async {
    OffersModel? response = await createCardPostRequest.fetchOffers();
    emit(state.copyWith(offersModel: response));
  }

  // ** Set Sponsor & Active Offers
  void get setSponsorAndActiveOffers {
    List<OfferModel>? sponsorOffers =
        state.offersModel?.sponsored_offers?.toList();
    List<OfferModel>? activeOffers = state.offersModel?.active_offers?.toList();
    List<OfferModel>? sponsorAndActiveOffers = [
      ...sponsorOffers ?? [],
      ...activeOffers ?? []
    ];
    emit(state.copyWith(sponsorAndActiveOffers: sponsorAndActiveOffers));
  }

  // ** Open Dialog
  void openDialogForDetails(
      {required BuildContext context, required offerModel}) {
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        useRootNavigator: false,
        builder: (context) {
          return Hero(
            tag: 'creditCardTag',
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Material(
                color: Colors.transparent.withOpacity(0.5),
                child: Center(
                  child: CreditCardDetailDialogWidget(
                    offerModel: offerModel,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
