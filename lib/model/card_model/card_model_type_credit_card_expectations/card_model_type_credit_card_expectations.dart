import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/credit_card_expectations_extension.dart';

// ** Credit Card Expectations
class CardModelTypeCreditCardExpectations extends CardModelType {
  CardModelTypeCreditCardExpectations(String text) : super(text: text);
}

// Credit Card Expectations subclasses
// Point
class CardModelTypeCreditCardExpectationsPoint
    extends CardModelTypeCreditCardExpectations {
  CardModelTypeCreditCardExpectationsPoint()
      : super(CreditCardExpectationsEnum.point.asString);
}

// Mill
class CardModelTypeCreditCardExpectationsMill
    extends CardModelTypeCreditCardExpectations {
  CardModelTypeCreditCardExpectationsMill()
      : super(CreditCardExpectationsEnum.mill.asString);
}

// Discount
class CardModelTypeCreditCardExpectationsDiscount
    extends CardModelTypeCreditCardExpectations {
  CardModelTypeCreditCardExpectationsDiscount()
      : super(CreditCardExpectationsEnum.discount.asString);
}

// Installment Opportunity
class CardModelTypeCreditCardExpectationsInstallmentOpportunity
    extends CardModelTypeCreditCardExpectations {
  CardModelTypeCreditCardExpectationsInstallmentOpportunity()
      : super(CreditCardExpectationsEnum.installmentOpportunity.asString);
}
