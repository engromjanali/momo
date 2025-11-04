import 'dart:ui';
import 'package:flutter/material.dart';

class WGlass extends StatelessWidget {
  final BoxBorder? border;
  final EdgeInsets? padding;
  final Widget child;
  final BorderRadius? borderRadius;

  const WGlass({
    super.key,
    this.border,
    this.padding,
    required this.child,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10,
          sigmaY: 10,
          // tileMode: TileMode.mirror
        ),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(50),
            border: border,
          ),
          child: child,
        ),
      ),
    );
  }
}
