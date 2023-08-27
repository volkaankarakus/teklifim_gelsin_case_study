import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teklifim_gelsin_case_study/constant/color_constant.dart';
import 'package:teklifim_gelsin_case_study/widget/box_container.dart';
import 'package:teklifim_gelsin_case_study/widget/dynamic_sized_box.dart';

class ApplyNowContainerWidget extends StatelessWidget {
  final Function()? onTap;
  final String text;
  const ApplyNowContainerWidget({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: BoxContainer(
        height: 50,
        color: ColorConstant.kContinueBoxContainerFilledBackgroundColor(),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.arrowUpRightFromSquare,
              color: ColorConstant.kContinueBoxContainerTextColor(),
              size: 20,
            ),
            DynamicSizedBox(
                size: MediaQuery.sizeOf(context).height * 0.01,
                axis: Axis.horizontal),
            Text(text,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color:
                          const ColorConstant.kContinueBoxContainerTextColor(),
                      fontWeight: FontWeight.bold,
                    )),
          ],
        ),
      ),
    );
  }
}
