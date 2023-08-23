import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/constant/duration_constant.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_how_old_are_u/card_model_type_how_old_are_u.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_spending_habits/card_model_type_spending_habits.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/list_card_model_extension.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/static_model/static_model.dart';
import 'package:teklifim_gelsin_case_study/model/offers_model.dart';
import 'package:teklifim_gelsin_case_study/request/post/create_card_post_request.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/card_model_extension.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState()) {
    Future.microtask(() => fetchData());
  }
  CreateCardPostRequest createCardPostRequest = CreateCardPostRequest();

  Future<void> fetchData() async {
    OffersModel? response = await createCardPostRequest.fetchOffers();
    emit(state.copyWith(offersModel: response));
  }

  // To define a list that will be manipulated in HomeState,
  //   we implement this in Cubit and call it with didChangeDependencies in the view.
  void initLists() {
    emit(state.copyWith(selectedSpendingHabitsList: []));
    emit(state.copyWith(spendingHabitsCardList: []));
  }

  void changeIsSelected({required CardModel<CardModelType> cardModel}) {
    if (cardModel.type is CardModelTypeHowOldAreU) {
      emit(state.copyWith(selectedHowOldAreUCardModel: cardModel));
      List<CardModel<CardModelType>> cardModelList = cardModel.changeIsSelected(
          listCardModel: StaticModel.howOldAreUCardList ?? []);
      emit(state.copyWith(howOldAreYouCardList: cardModelList));
      nextPage();
    } else if (cardModel.type is CardModelTypeSpendingHabits) {
      List<CardModel<CardModelType>>? selectedSpendingHabits =
          state.selectedSpendingHabitsList?.toList();
      selectedSpendingHabits?.add(cardModel);
      cardModel.changeIsSelectedSpendingHabits(
          listCardModel: selectedSpendingHabits ?? []);
      emit(state.copyWith(selectedSpendingHabitsList: selectedSpendingHabits));
      List<CardModel<CardModelType>>? spendingHabitsCardList =
          state.spendingHabitsCardList?.toList();

      emit(state.copyWith(spendingHabitsCardList: spendingHabitsCardList));
    }
  }

  void incrementCounter() {
    emit(state.copyWith(counter: ++counter));
  }

  void decrementCounter() {
    emit(state.copyWith(counter: --counter));
  }

  void nextPage() {
    incrementCounter();

    state.controller?.nextPage(
      duration: DurationConstant.kStandartPageTransitionDuration(),
      curve: Curves.bounceIn,
    );
    emit(state.copyWith(controller: state.controller));
  }

  void previousPage() {
    decrementCounter();
    state.controller?.previousPage(
      duration: DurationConstant.kStandartPageTransitionDuration(),
      curve: Curves.bounceIn,
    );
    emit(state.copyWith(controller: state.controller));
  }
}
