import 'package:get/utils.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_how_old_are_u/card_model_type_how_old_are_u.dart';

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
      this.isSelected = !(this.isSelected ?? false);
    } else {
      this.isSelected = !(this.isSelected ?? false);
    }
    return listCardModel;
  }

  List<CardModel<CardModelType>> changeIsSelectedSpendingHabits(
      {required List<CardModel<CardModelType>> listCardModel}) {
         this.isSelected = !(this.isSelected ?? false);

    return listCardModel;
  }

}
