import 'package:flutter/material.dart';

class ColorConstant extends Color {
  const ColorConstant.kBackgroundColor() : super.fromRGBO(245, 245, 245, 1);
  const ColorConstant.kTextColorBlack() : super.fromRGBO(27, 27, 27, 1);
  const ColorConstant.kBoxContainerBackgroundColor()
      : super.fromRGBO(255, 255, 255, 1);
  const ColorConstant.kBoxContainerColorPassive()
      : super.fromRGBO(236, 236, 236, 1);
  const ColorConstant.kBoxContainerColorActive()
      : super.fromRGBO(33, 47, 86, 1);
  const ColorConstant.kBoxContainerBorderColor()
      : super.fromRGBO(223, 223, 223, 1);
  const ColorConstant.kBoxContainerTextColorPassive()
      : super.fromRGBO(35, 50, 82, 1);
}
