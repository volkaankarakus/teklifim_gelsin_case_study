enum SpendingHabitsEnum {
  trip,
  onlineShopping,
  eatingAndDrinking,
  foodAndMarket,
  bill,
  other,
}

extension SpendingHabitsExtension on SpendingHabitsEnum {
  String get asString {
    switch (this) {
      case SpendingHabitsEnum.trip:
        return 'Seyehat';
      case SpendingHabitsEnum.onlineShopping:
        return 'Online Alışveriş';
      case SpendingHabitsEnum.eatingAndDrinking:
        return 'Yeme/İçme';
      case SpendingHabitsEnum.foodAndMarket:
        return 'Gıda/Market';
      case SpendingHabitsEnum.bill:
        return 'Fatura';
      case SpendingHabitsEnum.other:
        return 'Diğer';
    }
  }

  int get asIDInt {
    switch (this) {
      case SpendingHabitsEnum.trip:
        return 1;
      case SpendingHabitsEnum.onlineShopping:
        return 2;
      case SpendingHabitsEnum.eatingAndDrinking:
        return 3;
      case SpendingHabitsEnum.foodAndMarket:
        return 4;
      case SpendingHabitsEnum.bill:
        return 5;
      case SpendingHabitsEnum.other:
        return 6;
    }
  }
}
