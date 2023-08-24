import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_case_study/widget/dynamic_sized_box.dart';

class PageHeadlineWidget extends StatelessWidget {
  final String headlineText;
  const PageHeadlineWidget({
    super.key,
    required this.headlineText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DynamicSizedBox(size: MediaQuery.sizeOf(context).height * 0.01),
        Text(
          headlineText,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        DynamicSizedBox(size: MediaQuery.sizeOf(context).height * 0.02),
      ],
    );
  }
}
