import 'package:flutter/material.dart';

class CreditCardDetailDialogExplanationsColumnWidget extends StatelessWidget {
  final String headlineText;
  final String valueText;
  const CreditCardDetailDialogExplanationsColumnWidget({
    super.key,
    required this.headlineText,
    required this.valueText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Text(headlineText),
          ],
        ),
        Text(valueText),
      ],
    );
  }
}
