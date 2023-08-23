enum CreditCardExpectationsEnum {
  point,
  mill,
  discount,
  installmentOpportunity,
}

extension CreditCardExpectationsExtension on CreditCardExpectationsEnum {
  String get asString {
    switch (this) {
      case CreditCardExpectationsEnum.point:
        return 'Puan';
      case CreditCardExpectationsEnum.mill:
        return 'Mil';
      case CreditCardExpectationsEnum.discount:
        return 'İndirim';
      case CreditCardExpectationsEnum.installmentOpportunity:
        return 'Taksit İmkanı';
    }
  }

  int get asIDInt {
    switch (this) {
      case CreditCardExpectationsEnum.point:
        return 1;
      case CreditCardExpectationsEnum.mill:
        return 2;
      case CreditCardExpectationsEnum.discount:
        return 3;
      case CreditCardExpectationsEnum.installmentOpportunity:
        return 4;
    }
  }
}
