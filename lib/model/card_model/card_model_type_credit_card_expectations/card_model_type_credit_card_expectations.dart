import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/credit_card_expectations_extension.dart';

// ** Credit Card Expectations
class CardModelTypeCreditCardExpectations extends CardModelType {
  CardModelTypeCreditCardExpectations({required String text, required int id})
      : super(text: text, id: id);
}

// Credit Card Expectations subclasses
// Point
class CardModelTypeCreditCardExpectationsPoint
    extends CardModelTypeCreditCardExpectations {
  CardModelTypeCreditCardExpectationsPoint()
      : super(
          id: CreditCardExpectationsEnum.point.asIDInt,
          text: CreditCardExpectationsEnum.point.asString,
        );
}

// Mill
class CardModelTypeCreditCardExpectationsMill
    extends CardModelTypeCreditCardExpectations {
  CardModelTypeCreditCardExpectationsMill()
      : super(
          id: CreditCardExpectationsEnum.mill.asIDInt,
          text: CreditCardExpectationsEnum.mill.asString,
        );
}

// Discount
class CardModelTypeCreditCardExpectationsDiscount
    extends CardModelTypeCreditCardExpectations {
  CardModelTypeCreditCardExpectationsDiscount()
      : super(
          id: CreditCardExpectationsEnum.discount.asIDInt,
          text: CreditCardExpectationsEnum.discount.asString,
        );
}

// Installment Opportunity
class CardModelTypeCreditCardExpectationsInstallmentOpportunity
    extends CardModelTypeCreditCardExpectations {
  CardModelTypeCreditCardExpectationsInstallmentOpportunity()
      : super(
          id: CreditCardExpectationsEnum.installmentOpportunity.asIDInt,
          text: CreditCardExpectationsEnum.installmentOpportunity.asString,
        );
}
