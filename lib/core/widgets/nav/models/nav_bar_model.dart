import 'package:flutter/material.dart';

class NavigationBarItem {
  /// An icon to display.
  final String icon, unSelectedIcon;
  final String? title;

  /// The Widget to display view of the screen when this tab is selected.
  final Widget? child;

  NavigationBarItem({
    required this.icon,
    required this.unSelectedIcon,
    this.title,
    this.child,
  });
}
