import 'package:flutter/material.dart';

/// 🎨 PColors
/// A central place for managing all theme-related colors in the project.
/// 🔧 Includes:
/// - Primary, secondary, and app bar colors
/// - Background, border, and corporate branding colors
/// - Uses `withValues` for dynamic alpha adjustments
class PColors {
  // Core Colors
  static const primaryColorLight = Color(0XFFFFFFFF);
  static const primaryColorDark = Color(0xFF141416);

  static const nevColorLight = Color(0xEF000000);
  static const nevColorDark = Color(0xEF000000);

  static const appBarColorLight = Color(0XFFFFFFFF);
  static const appBarColorDark = Color(0xFF000000);

  static const cardColorLight = Color(0xFF141416);
  static const cardColorDark = Color.fromARGB(255, 183, 183, 202);

  static const primaryButtonColorLight = Color.fromARGB(255, 207, 119, 119);
  static const primaryButtonColorDark = Color(0XFFFFFFFF);

  //fill color
  static const fillColorLight = Color(0xFF000000);
  static const fillColorDark = Color(0xFF000000);

  // Backgrounds
  static const backGroundColorLight = Color(0xFF000000);
  static const backGroundColorDark = Color(0xFF000000);

  // Borders
  static final borderColorLight = Color(0xFF2B2B2B);
  static final borderColorDark = Color(0xFF2B2B2B);

  // Divider Colors/
  static final dividerColorLight = Color(0xFF171717);
  static final dividerColorDark = Color(0xFF171717);

  // Text Colors
  static const primayTextColorLight = Color(0XFFFFFFFF);
  static const primayTextColorDark = Color(0XFFFFFFFF);
  static const secondaryTextColorLight = Color(0xFFAAAAAA);
  static const secondaryTextColorDark = Color(0xFFAAAAAA);
  static const additionalTextColorLight = Color(0XFFFFFFFF);
  static const additionalTextColorDark = Color(0XFFFFFFFF);

  // image filter color
  static Gradient imageFG = LinearGradient(
    begin: Alignment.bottomCenter, // start at bottom
    end: Alignment.topCenter,
    stops: [0.05, 0.1, 0.2, 1],
    // transform: GradientRotation(4),
    colors: [
      Colors.black, // bottom color
      Colors.black.withAlpha(50), // bottom color
      Colors.transparent, // top color
      Colors.transparent, // top color
    ],
  );
  static var proLinearGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Color(0xFF01FD8C), Color(0xFF2FDFFF)],
  );
}
