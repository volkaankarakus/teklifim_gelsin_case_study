import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';

class CardModel<T extends CardModelType> {
  int index;
  T type;
  bool? isSelected;

  CardModel({
    this.index = 0,
    required this.type,
    this.isSelected = false,
  });
}
