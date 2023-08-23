import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';

extension ListCardModelExtension on List<CardModel> {
  List<CardModel> addOrRemoveToSelectedList({required CardModel cardModel}) {
    if (contains(cardModel)) {
      remove(cardModel);
    } else {
      add(cardModel);
    }
    return this.toList();
  }
}
