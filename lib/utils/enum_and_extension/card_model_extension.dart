import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';

extension CardModelExtension on CardModel {
  String get getText => type.text;

  List<CardModel<CardModelType>> changeIsSelected(
      {required List<CardModel<CardModelType>> listCardModel}) {
    bool isNotFirstPick =
        listCardModel.where((element) => element.isSelected == true).isNotEmpty;
    if (isNotFirstPick) {
      for (var cardModel in listCardModel) {
        cardModel.isSelected = false;
      }
      isSelected = !(isSelected ?? false);
    } else {
      isSelected = !(isSelected ?? false);
    }
    return listCardModel;
  }

  List<CardModel<CardModelType>> changeIsSelectedSpendingHabits({
    required List<CardModel<CardModelType>> listCardModel,
  }) {
    isSelected = !(isSelected ?? false);

    return listCardModel;
  }
}
