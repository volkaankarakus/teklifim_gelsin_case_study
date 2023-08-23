import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/spending_habits_extension.dart';

// ** Spending Habits
class CardModelTypeSpendingHabits extends CardModelType {
  CardModelTypeSpendingHabits({required int id, required String text})
      : super(id: id, text: text);
}

// Trip
class CardModelTyoeSpendingHabitsTrip extends CardModelTypeSpendingHabits {
  CardModelTyoeSpendingHabitsTrip()
      : super(
          id: SpendingHabitsEnum.trip.asIDInt,
          text: SpendingHabitsEnum.trip.asString,
        );
}

// Online Shopping
class CardModelTyoeSpendingHabitsOnlineShopping
    extends CardModelTypeSpendingHabits {
  CardModelTyoeSpendingHabitsOnlineShopping()
      : super(
          id: SpendingHabitsEnum.onlineShopping.asIDInt,
          text: SpendingHabitsEnum.onlineShopping.asString,
        );
}

// Eating and Drinking
class CardModelTyoeSpendingHabitsEatingAndDrinking
    extends CardModelTypeSpendingHabits {
  CardModelTyoeSpendingHabitsEatingAndDrinking()
      : super(
          id: SpendingHabitsEnum.eatingAndDrinking.asIDInt,
          text: SpendingHabitsEnum.eatingAndDrinking.asString,
        );
}

// Food And Market
class CardModelTyoeSpendingHabitsFoodAndMarket
    extends CardModelTypeSpendingHabits {
  CardModelTyoeSpendingHabitsFoodAndMarket()
      : super(
          id: SpendingHabitsEnum.foodAndMarket.asIDInt,
          text: SpendingHabitsEnum.foodAndMarket.asString,
        );
}

// Bill
class CardModelTyoeSpendingHabitsBill extends CardModelTypeSpendingHabits {
  CardModelTyoeSpendingHabitsBill()
      : super(
          id: SpendingHabitsEnum.bill.asIDInt,
          text: SpendingHabitsEnum.bill.asString,
        );
}

// Other
class CardModelTyoeSpendingHabitsOther extends CardModelTypeSpendingHabits {
  CardModelTyoeSpendingHabitsOther()
      : super(
          id: SpendingHabitsEnum.other.asIDInt,
          text: SpendingHabitsEnum.other.asString,
        );
}
