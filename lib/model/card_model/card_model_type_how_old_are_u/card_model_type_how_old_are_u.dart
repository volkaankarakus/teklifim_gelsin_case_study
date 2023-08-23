import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/how_old_are_u_extension.dart';

// ** How old are u ?
class CardModelTypeHowOldAreU extends CardModelType {
  CardModelTypeHowOldAreU({required int id, required String text})
      : super(id: id, text: text);
}

// ** How old are u subclasses
// -18 & 18
class CardModelTypeHowOldAreUUnder18 extends CardModelTypeHowOldAreU {
  CardModelTypeHowOldAreUUnder18()
      : super(
          id: HowOldAreUEnum.youngerAndEqual18.asIDInt,
          text: HowOldAreUEnum.youngerAndEqual18.asString,
        );
}

// 19 - 25
class CardModelTypeHowOldAreUBetween19and25 extends CardModelTypeHowOldAreU {
  CardModelTypeHowOldAreUBetween19and25()
      : super(
          id: HowOldAreUEnum.between19and25.asIDInt,
          text: HowOldAreUEnum.between19and25.asString,
        );
}

// 26 - 35
class CardModelTypeHowOldAreUBetween26and35 extends CardModelTypeHowOldAreU {
  CardModelTypeHowOldAreUBetween26and35()
      : super(
          id: HowOldAreUEnum.between26and35.asIDInt,
          text: HowOldAreUEnum.between26and35.asString,
        );
}

// 36 & +36
class CardModelTypeHowOldAreUOlderAndEqual36 extends CardModelTypeHowOldAreU {
  CardModelTypeHowOldAreUOlderAndEqual36()
      : super(
          id: HowOldAreUEnum.olderAndEqual36.asIDInt,
          text: HowOldAreUEnum.olderAndEqual36.asString,
        );
}
