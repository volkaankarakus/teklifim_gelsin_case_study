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
}
