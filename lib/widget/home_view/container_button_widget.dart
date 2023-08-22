import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_case_study/constant/color_constant.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/card_model_extension.dart';
import 'package:teklifim_gelsin_case_study/widget/box_container.dart';

class ContainerButtonWidget<T extends CardModelType> extends StatelessWidget {
  final CardModel<T> cardModel;
  ContainerButtonWidget({required this.cardModel});

  @override
  Widget build(BuildContext context) {
    return BoxContainer(
      border: Border.all(
        color: ColorConstant.kBoxContainerBorderColor(),
        width: 50,
      ),
      color: (cardModel.isSelected ?? false)
          ? ColorConstant.kBoxContainerColorActive()
          : ColorConstant.kBoxContainerColorPassive(),
      child: Center(
        child: Text(
          cardModel.getText,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: (cardModel.isSelected ?? false)
                  ? ColorConstant.kBoxContainerBackgroundColor()
                  : ColorConstant.kBoxContainerTextColorPassive(),
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
