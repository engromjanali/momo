import 'package:flutter/material.dart';
import 'package:momo/core/extensions/ex_build_context.dart';


class WCancleButton extends StatelessWidget {
  final Function() onTap;
  const WCancleButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        Icons.cancel_rounded,
        color: context.primaryTextColor,
        size: 35,
      ),
    );
  }
}
