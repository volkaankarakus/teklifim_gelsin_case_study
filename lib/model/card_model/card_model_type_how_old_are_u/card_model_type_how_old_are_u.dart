import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/how_old_are_u_extension.dart';

// ** How old are u ?
class CardModelTypeHowOldAreU extends CardModelType {
  CardModelTypeHowOldAreU(String text) : super(text: text);
}

// ** How old are u subclasses
// -18 & 18
class CardModelTypeHowOldAreUUnder18 extends CardModelTypeHowOldAreU {
  CardModelTypeHowOldAreUUnder18()
      : super(HowOldAreUEnum.youngerAndEqual18.asString);
}

// 19 - 25
class CardModelTypeHowOldAreUBetween19and25 extends CardModelTypeHowOldAreU {
  CardModelTypeHowOldAreUBetween19and25()
      : super(HowOldAreUEnum.between19and25.asString);
}

// 26 - 35
class CardModelTypeHowOldAreUBetween26and35 extends CardModelTypeHowOldAreU {
  CardModelTypeHowOldAreUBetween26and35()
      : super(HowOldAreUEnum.between26and35.asString);
}

// 36 & +36
class CardModelTypeHowOldAreUOlderAndEqual36 extends CardModelTypeHowOldAreU {
  CardModelTypeHowOldAreUOlderAndEqual36()
      : super(HowOldAreUEnum.olderAndEqual36.asString);
}
