import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_credit_card_expectations/card_model_type_credit_card_expectations.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_how_old_are_u/card_model_type_how_old_are_u.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_spending_habits/card_model_type_spending_habits.dart';

class StaticModel {
  // ** How old are u Card List
  static List<CardModel>? howOldAreUCardList =
      <CardModel<CardModelTypeHowOldAreU>>[
    CardModel(
      index: 0,
      type: CardModelTypeHowOldAreUUnder18(),
    ),
    CardModel(
      index: 1,
      type: CardModelTypeHowOldAreUBetween19and25(),
    ),
    CardModel(
      index: 2,
      type: CardModelTypeHowOldAreUBetween26and35(),
    ),
    CardModel(
      index: 3,
      type: CardModelTypeHowOldAreUOlderAndEqual36(),
    ),
  ];

  // Spending Habits Card List
  static List<CardModel>? spendingHabitsCardList =
      <CardModel<CardModelTypeSpendingHabits>>[
    CardModel(
      index: 0,
      type: CardModelTyoeSpendingHabitsTrip(),
    ),
    CardModel(
      index: 1,
      type: CardModelTyoeSpendingHabitsOnlineShopping(),
    ),
    CardModel(
      index: 2,
      type: CardModelTyoeSpendingHabitsEatingAndDrinking(),
    ),
    CardModel(
      index: 3,
      type: CardModelTyoeSpendingHabitsFoodAndMarket(),
    ),
    CardModel(
      index: 4,
      type: CardModelTyoeSpendingHabitsBill(),
    ),
    CardModel(
      index: 5,
      type: CardModelTyoeSpendingHabitsOther(),
    ),
  ];

  // Credit Card Expectations Card List
  static List<CardModel>? creditCardExpectationsCardList =
      <CardModel<CardModelTypeCreditCardExpectations>>[
    CardModel(
      index: 0,
      type: CardModelTypeCreditCardExpectationsPoint(),
    ),
    CardModel(
      index: 1,
      type: CardModelTypeCreditCardExpectationsMill(),
    ),
    CardModel(
      index: 2,
      type: CardModelTypeCreditCardExpectationsDiscount(),
    ),
    CardModel(
      index: 3,
      type: CardModelTypeCreditCardExpectationsInstallmentOpportunity(),
    ),
  ];
}
