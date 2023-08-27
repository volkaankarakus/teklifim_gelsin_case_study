import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teklifim_gelsin_case_study/constant/color_constant.dart';

@immutable
class SliverAppbarWidget extends StatefulWidget {
  final void Function()? onPressedAction;
  const SliverAppbarWidget({super.key, this.onPressedAction});

  @override
  State<SliverAppbarWidget> createState() => _SliverAppbarWidgetState();
}

class _SliverAppbarWidgetState extends State<SliverAppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      surfaceTintColor: Theme.of(context).appBarTheme.backgroundColor,
      pinned: false,
      floating: true,
      expandedHeight: MediaQuery.sizeOf(context).height * 0.13,
      title: Column(
        children: [
          Image.asset(
            'lib/assets/home_view/img_logo.png',
            width: 200,
            fit: BoxFit.fitWidth,
          ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Kredi Kartları',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      actions: [
        IconButton(
          onPressed: widget.onPressedAction,
          icon: const Icon(
            CupertinoIcons.gift,
            size: 30,
            color: ColorConstant.kTextColorBlack(),
          ),
        ),
      ],
    );
  }
}
