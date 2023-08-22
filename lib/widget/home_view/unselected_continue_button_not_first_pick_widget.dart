import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/constant/color_constant.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';
import 'package:teklifim_gelsin_case_study/widget/box_container.dart';

class UnselectedContinueButtonNotFirstPickWidget extends StatelessWidget {
  const UnselectedContinueButtonNotFirstPickWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => context.read<HomeCubit>().previousPage(),
          child: BoxContainer(
            color: ColorConstant.kBackBoxContainerBackgroundColor(),
            width: MediaQuery.sizeOf(context).height * 0.1,
            child: Icon(Icons.chevron_left,
                color: ColorConstant.kContinueBoxContainerTextColor()),
          ),
        ),
        BoxContainer(
          color: ColorConstant.kContinueBoxContainerBackgroundColor(),
          width: MediaQuery.sizeOf(context).height * 0.263,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Devam et',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: ColorConstant.kContinueBoxContainerTextColor(),
                      )),
              Icon(
                Icons.chevron_right,
                color: ColorConstant.kContinueBoxContainerTextColor(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
