import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  final void Function()? onPressedAction;
  const AppbarWidget({super.key, this.onPressedAction});

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AppbarWidgetState extends State<AppbarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      title: Image.asset(
        'lib/assets/home_view/img_logo.png',
        width: 200,
        fit: BoxFit.fitWidth,
      ),
      actions: [
        IconButton(
          onPressed: widget.onPressedAction,
          icon: const Icon(
            CupertinoIcons.gift,
            size: 30,
          ),
        ),
      ],
    );
  }
}
