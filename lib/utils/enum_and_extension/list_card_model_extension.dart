import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_credit_card_expectations/card_model_type_credit_card_expectations.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_spending_habits/card_model_type_spending_habits.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';

extension ListCardModelExtension on List<CardModel<CardModelType>>? {
  void isContainsInListControl({required CardModel<CardModelType> cardModel}) {
    if (this?.contains(cardModel) ?? false) {
      if (this!.last != cardModel) {
        for (var element in (this ?? [])) {
          if (element.index > cardModel.index) {
            element.index--;
          }
        }
      }
      cardModel.index = 0;
      this?.remove(cardModel);
    } else {
      this?.add(cardModel);
    }
  }

  List<CardModel<CardModelType>>? determineSelectedListFromType(
      {required BuildContext context}) {
    if (this is CardModelTypeSpendingHabits) {
      return context.watch<HomeCubit>().state.selectedSpendingHabitsList;
    }
    if (this is CardModelTypeCreditCardExpectations) {
      return context.watch<HomeCubit>().state.selectedCreditCardExpectations;
    }
    return [];
  }

  // ** DETERMINE AGE POINTS
  int get determineAgeJsonData {
    return this?.firstWhere((element) => element.isSelected == true).type.id ?? 0;
  }

  // ** DETERMINE CARD POINTS
  List<CardModel<CardModelType>> get determineCardPointsJsonData {
    List<CardModel<CardModelType>>? selectedCards =
        this?.where((element) => element.isSelected == true).toList();
     List<CardModel<CardModelType>>? unSelectedCards =
        this?.where((element) => element.isSelected != true).toList();
      

    selectedCards?.sort((a, b) => a.index.compareTo(b.index));

    int selectedCardsLength = selectedCards?.length ?? 0;
    List<int> a = [13, 8, 5, 3, 2, 1];
    for (int i = 0; i < selectedCardsLength; i++) {
      selectedCards![i].point = a[6 - selectedCardsLength + i];
    }
    return [...selectedCards!,...unSelectedCards!];
  }
}
