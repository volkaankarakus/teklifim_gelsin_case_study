import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/constant/color_constant.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';
import 'package:teklifim_gelsin_case_study/widget/box_container.dart';

class UnselectedContinueButtonCreditCardExpectationWidgets
    extends StatelessWidget {
  final String headlineText;
  const UnselectedContinueButtonCreditCardExpectationWidgets({
    super.key,
    required this.headlineText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () => context.read<HomeCubit>().previousPage(),
          child: BoxContainer(
            color: const ColorConstant.kBackBoxContainerBackgroundColor(),
            width: MediaQuery.sizeOf(context).height * 0.1,
            child: const Icon(Icons.chevron_left,
                color: ColorConstant.kContinueBoxContainerTextColor()),
          ),
        ),
        IgnorePointer(
          ignoring: (context
                      .watch<HomeCubit>()
                      .state
                      .selectedCreditCardExpectations
                      ?.isEmpty ??
                  true)
              ? true
              : false,
          child: InkWell(
            onTap: () => context
                .read<HomeCubit>()
                .navigateToHomeDetailView(context: context),
            child: BoxContainer(
              color: (context
                          .watch<HomeCubit>()
                          .state
                          .selectedCreditCardExpectations
                          ?.isEmpty ??
                      true)
                  ? const ColorConstant.kContinueBoxContainerBackgroundColor()
                  : const ColorConstant
                      .kContinueBoxContainerFilledBackgroundColor(),
              width: MediaQuery.sizeOf(context).height * 0.263,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(headlineText,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: const ColorConstant
                                .kContinueBoxContainerTextColor(),
                          )),
                  const Icon(
                    Icons.chevron_right,
                    color: ColorConstant.kContinueBoxContainerTextColor(),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
