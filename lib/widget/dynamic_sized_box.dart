import 'package:flutter/material.dart';

class DynamicSizedBox extends StatelessWidget {
  final double size;
  final bool lowPadding;
  final Axis axis;
  const DynamicSizedBox({
    Key? key,
    this.axis = Axis.vertical,
    this.size = 20,
    this.lowPadding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (axis == Axis.horizontal) {
      return SizedBox(
        width: lowPadding
            ? double.parse(
                const EdgeInsets.symmetric(horizontal: 20.0).toString())
            : size,
      );
    }
    return SizedBox(
      height: lowPadding
          ? double.parse(
              const EdgeInsets.symmetric(horizontal: 20.0).toString())
          : size,
    );
  }
}
