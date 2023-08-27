import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_credit_card_expectations/card_model_type_credit_card_expectations.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_spending_habits/card_model_type_spending_habits.dart';
import 'package:teklifim_gelsin_case_study/model/offer_model.dart';
import 'package:teklifim_gelsin_case_study/model/offers_model.dart';
import 'package:teklifim_gelsin_case_study/request/post/create_card_post_request.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/list_card_model_extension.dart';
import 'package:teklifim_gelsin_case_study/widget/home_detail_view/home_detail_dialog/credit_card_detail_dialog_widget.dart';

part 'home_detail_state.dart';

class HomeDetailCubit extends Cubit<HomeDetailState> {
  HomeDetailCubit() : super(HomeDetailState()) {
    Future.microtask(() {
      fetchData;
    });
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

  // ** Data toJson
  Map<String, String> toMap(
      {required List<CardModel<CardModelType>>? howOldAreYouCardList,
      required List<CardModel<CardModelType>> pointsFilledSpendingHabitsList,
      required List<CardModel<CardModelType>>
          pointsFilledcreditCardExpectations}) {
    return {
      "age": howOldAreYouCardList.determineAgeJsonData.toString(),
      "bill": pointsFilledSpendingHabitsList
          .singleWhere((element) => (element.type.id == 5))
          .point
          .toString(),
      "dining": pointsFilledSpendingHabitsList
          .singleWhere((element) => element.type.id == 3)
          .point
          .toString(),
      "grocery": pointsFilledSpendingHabitsList
          .singleWhere((element) => element.type.id == 4)
          .point
          .toString(),
      "installment": pointsFilledcreditCardExpectations
          .singleWhere((element) => element.type.id == 4)
          .point
          .toString(),
      "mile": pointsFilledcreditCardExpectations
          .singleWhere((element) => element.type.id == 2)
          .point
          .toString(),
      "online_shopping": pointsFilledSpendingHabitsList
          .singleWhere((element) => element.type.id == 2)
          .point
          .toString(),
      "other": pointsFilledSpendingHabitsList
          .singleWhere((element) => element.type.id == 6)
          .point
          .toString(),
      "point": pointsFilledcreditCardExpectations
          .singleWhere((element) => element.type.id == 1)
          .point
          .toString(),
      "sale_cashback": pointsFilledcreditCardExpectations
          .singleWhere((element) => element.type.id == 3)
          .point
          .toString(),
      "travel": pointsFilledSpendingHabitsList
          .singleWhere((element) => element.type.id == 1)
          .point
          .toString(),
    };
  }

  // ** Get Data
  Future<void> get fetchData async {
    // filled Credit Card Expectations
    List<CardModel<CardModelType>>? pointsFilledcreditCardExpectations = state
        .creditCardExpectationsCardList.determineCardPointsJsonData
        .toList();

    // filled Spending Habits Card Expectations
    List<CardModel<CardModelType>>? pointsFilledSpendingHabitsList =
        state.spendingHabitsCardList.determineCardPointsJsonData.toList();

    Map<String, String> data = toMap(
      howOldAreYouCardList: state.howOldAreYouCardList?.toList(),
      pointsFilledSpendingHabitsList: pointsFilledSpendingHabitsList,
      pointsFilledcreditCardExpectations: pointsFilledcreditCardExpectations,
    );

    OffersModel? response = await createCardPostRequest.fetchOffers(data: data);
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
          return GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Material(
              color: Colors.transparent.withOpacity(0.5),
              child: Center(
                child: CreditCardDetailDialogWidget(
                  offerModel: offerModel,
                ),
              ),
            ),
          );
        });
  }
}
