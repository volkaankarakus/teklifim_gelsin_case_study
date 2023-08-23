import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_case_study/widget/home_view/continue_button/unselected_continue_button_credit_card_expectations_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/home_view/continue_button/unselected_continue_button_first_pick_widget.dart';
import 'package:teklifim_gelsin_case_study/widget/home_view/continue_button/unselected_continue_button_spending_habits_widget.dart';

extension IntExtension on int {
  Widget get asWidgetforCounter {
    switch (this) {
      case 1:
        return const UnselectedContinueButtonFirstPickWidget();
      case 2:
        return const UnselectedContinueButtonSpendingHabits(
          headlineText: 'Devam et',
        );
      case 3:
        return const UnselectedContinueButtonCreditCardExpectationWidgets(
          headlineText: 'Teklifim Gelsin',
        );
    }
    return const UnselectedContinueButtonFirstPickWidget();
  }
}
