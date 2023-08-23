import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';
import 'package:teklifim_gelsin_case_study/widget/home_view/continue_button/unselected_continue_button_first_pick_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/home_view/continue_button/unselected_continue_button_not_first_pick_widget.dart';

class ContinueButtonWidget extends StatelessWidget {
  const ContinueButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, int>(
      selector: (state) => state.counter ?? 1,
      builder: (context, state) {
        return AnimatedContainer(
          duration: Duration(seconds: 2),
          child: state == 1
              ? UnselectedContinueButtonFirstPickWidget()
              : UnselectedContinueButtonNotFirstPickWidget(),
        );
      },
    );
  }
}