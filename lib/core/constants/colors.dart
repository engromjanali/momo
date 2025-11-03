import 'package:flutter/material.dart';

/// 🎨 PColors
/// A central place for managing all theme-related colors in the project.
/// 🔧 Includes:
/// - Primary, secondary, and app bar colors
/// - Background, border, and corporate branding colors
/// - Uses `withValues` for dynamic alpha adjustments
class PColors {
  // Core Colors
  static const primaryColor = Color(0xFF4857F6);
  static const secondaryButtonColor = Color(0xFF002E5B);
  static const appBarColor = Color(0xFF3AADE1);

  // Backgrounds
  static const backGroundColorLight = Color(0xFFF5F5F5);
  static const backGroundColorDark = Color(0xFF121212);

  // Borders
  static final borderColorLight = Color.fromRGBO(107, 123, 140, 0.1);
  static final borderColorDark = const Color(0xFFB2B2B2);

  // Divider Colors/
  static final dividerColorLight = PColors.primaryColor.withValues(alpha: 0.5);
  static final dividerColorDark = PColors.primaryColor.withValues(alpha: 0.5);

  // Text Colors
  static const primayTextColorLight = Colors.black;
  static const primayTextColorDark = Colors.white;
  static const secondaryTextColorLight = Color(0xFF727272);
  static const secondaryTextColorDark = Color(0xFFBDBDBD);
  static const additionalTextColorLight = Color(0xFF357A7B);
  static const additionalTextColorDark = Color(0xFF6AB2B4); // optional tweak
}
