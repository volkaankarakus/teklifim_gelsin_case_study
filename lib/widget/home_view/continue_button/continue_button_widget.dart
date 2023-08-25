import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifim_gelsin_case_study/view_model(cubit)/home/home_cubit.dart';
import 'package:teklifim_gelsin_case_study/utils/enum_and_extension/int_extension.dart';

class ContinueButtonWidget extends StatelessWidget {
  const ContinueButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(seconds: 2),
        child: context.watch<HomeCubit>().state.counter?.asWidgetforCounter ??
            const SizedBox.shrink());
  }
}
