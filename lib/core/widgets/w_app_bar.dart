import 'package:flutter/material.dart';

/// 🧭 Custom AppBar with optional right-side widgets and back button toggle
class WAppBar extends AppBar {
  final String text;
  final List<Widget>? rightWidgets;
  final bool textPositionCenter;
  final bool hideBackButton;

  /// 🚫 AppBar without back button
  WAppBar({
    super.key,
    required this.text,
    this.rightWidgets,
    this.textPositionCenter = false,
  }) : hideBackButton = true;

  /// 🔙 AppBar with back button
  WAppBar.withoutBack({
    super.key,
    required this.text,
    this.rightWidgets,
    this.textPositionCenter = false,
  }) : hideBackButton = false;

  @override
  bool get automaticallyImplyLeading => hideBackButton;

  @override
  bool? get centerTitle => textPositionCenter;

  @override
  Widget? get title => Text(text);

  @override
  List<Widget>? get actions => rightWidgets;
}
