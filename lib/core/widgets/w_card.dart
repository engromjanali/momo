import 'package:flutter/material.dart';
import 'package:momo/core/constants/dimension_theme.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';

class WCard extends StatelessWidget {
  final Widget child;
  const WCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.cardColor,
        borderRadius: BorderRadius.circular(PTheme.boarderRadius),
      ),
      child: child,
    );
  }
}
