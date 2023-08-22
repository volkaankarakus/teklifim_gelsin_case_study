import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/constant/color_constant.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model.dart';
import 'package:teklifim_gelsin_case_study/model/card_model/card_model_type.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';
import 'package:teklifim_gelsin_case_study/widget/box_container.dart';

class UnselectedContinueButtonFirstPickWidget extends StatelessWidget {
  const UnselectedContinueButtonFirstPickWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, CardModel<CardModelType>?>(
      selector: (state) => state.selectedHowOldAreUCardModel,
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state == null ? true : false,
          child: InkWell(
            onTap: () => context.read<HomeCubit>().nextPage(),
            child: BoxContainer(
              color: state == null
                  ? ColorConstant.kContinueBoxContainerBackgroundColor()
                  : ColorConstant.kContinueBoxContainerFilledBackgroundColor(),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Devam et',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color:
                                ColorConstant.kContinueBoxContainerTextColor(),
                          )),
                  Icon(
                    Icons.chevron_right,
                    color: ColorConstant.kContinueBoxContainerTextColor(),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
