import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_credit_card_expectations/card_model_type_credit_card_expectations.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_how_old_are_u/card_model_type_how_old_are_u.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_spending_habits/card_model_type_spending_habits.dart';

class StaticModel {
  // ** How old are u Card List
  static List<CardModel>? howOldAreUCardList =
      <CardModel<CardModelTypeHowOldAreU>>[
    CardModel(
      type: CardModelTypeHowOldAreUUnder18(),
    ),
    CardModel(
      type: CardModelTypeHowOldAreUBetween19and25(),
    ),
    CardModel(
      type: CardModelTypeHowOldAreUBetween26and35(),
    ),
    CardModel(
      type: CardModelTypeHowOldAreUOlderAndEqual36(),
    ),
  ];

  // Spending Habits Card List
  static List<CardModel>? spendingHabitsCardList =
      <CardModel<CardModelTypeSpendingHabits>>[
    CardModel(
      type: CardModelTyoeSpendingHabitsTrip(),
    ),
    CardModel(
      type: CardModelTyoeSpendingHabitsOnlineShopping(),
    ),
    CardModel(
      type: CardModelTyoeSpendingHabitsEatingAndDrinking(),
    ),
    CardModel(
      type: CardModelTyoeSpendingHabitsFoodAndMarket(),
    ),
    CardModel(
      type: CardModelTyoeSpendingHabitsBill(),
    ),
    CardModel(
      type: CardModelTyoeSpendingHabitsOther(),
    ),
  ];

  // Credit Card Expectations Card List
  static List<CardModel>? creditCardExpectationsCardList =
      <CardModel<CardModelTypeCreditCardExpectations>>[
    CardModel(
      type: CardModelTypeCreditCardExpectationsPoint(),
    ),
    CardModel(
      type: CardModelTypeCreditCardExpectationsMill(),
    ),
    CardModel(
      type: CardModelTypeCreditCardExpectationsDiscount(),
    ),
    CardModel(
      type: CardModelTypeCreditCardExpectationsInstallmentOpportunity(),
    ),
  ];
}
