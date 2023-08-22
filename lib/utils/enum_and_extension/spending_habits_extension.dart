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
}
