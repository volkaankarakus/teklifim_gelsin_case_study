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
}
