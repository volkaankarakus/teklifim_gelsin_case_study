import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/spending_habits_extension.dart';

// ** Spending Habits
class CardModelTypeSpendingHabits extends CardModelType {
  CardModelTypeSpendingHabits(String text) : super(text: text);
}

// Trip
class CardModelTyoeSpendingHabitsTrip extends CardModelTypeSpendingHabits {
  CardModelTyoeSpendingHabitsTrip() : super(SpendingHabitsEnum.trip.asString);
}

// Online Shopping
class CardModelTyoeSpendingHabitsOnlineShopping
    extends CardModelTypeSpendingHabits {
  CardModelTyoeSpendingHabitsOnlineShopping()
      : super(SpendingHabitsEnum.onlineShopping.asString);
}

// Eating and Drinking
class CardModelTyoeSpendingHabitsEatingAndDrinking
    extends CardModelTypeSpendingHabits {
  CardModelTyoeSpendingHabitsEatingAndDrinking()
      : super(SpendingHabitsEnum.eatingAndDrinking.asString);
}

// Food And Market
class CardModelTyoeSpendingHabitsFoodAndMarket
    extends CardModelTypeSpendingHabits {
  CardModelTyoeSpendingHabitsFoodAndMarket()
      : super(SpendingHabitsEnum.foodAndMarket.asString);
}

// Bill
class CardModelTyoeSpendingHabitsBill extends CardModelTypeSpendingHabits {
  CardModelTyoeSpendingHabitsBill() : super(SpendingHabitsEnum.bill.asString);
}

// Other
class CardModelTyoeSpendingHabitsOther extends CardModelTypeSpendingHabits {
  CardModelTyoeSpendingHabitsOther() : super(SpendingHabitsEnum.other.asString);
}
