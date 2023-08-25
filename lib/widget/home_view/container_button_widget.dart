import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_case_study/constant/color_constant.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type_how_old_are_u/card_model_type_how_old_are_u.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/card_model_extension.dart';
import 'package:teklifim_gelsin_case_study/widget/box_container.dart';

class ContainerButtonWidget<T extends CardModelType> extends StatelessWidget {
  final CardModel<T> cardModel;
  final Function()? onTap;
  const ContainerButtonWidget({super.key, 
    required this.cardModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            BoxContainer(
              border: Border.all(
                color: const ColorConstant.kBoxContainerBorderColor(),
                width: 50,
              ),
              color: (cardModel.isSelected ?? false)
                  ? const ColorConstant.kBoxContainerColorActive()
                  : const ColorConstant.kBoxContainerColorPassive(),
              child: Center(
                child: Text(
                  cardModel.getText,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: (cardModel.isSelected ?? false)
                          ? const ColorConstant.kBoxContainerBackgroundColor()
                          : const ColorConstant.kBoxContainerTextColorPassive(),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if ((cardModel.isSelected ?? false) &&
                cardModel.type is! CardModelTypeHowOldAreU)
              Positioned(
                right: 0,
                top: -10,
                child: BoxContainer(
                  width: 25,
                  enablePadding: false,
                  shape: BoxShape.circle,
                  color: const ColorConstant
                      .kContinueBoxContainerFilledBackgroundColor(),
                  child: Center(
                    child: Text(
                      cardModel.index.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ));
  }
}
