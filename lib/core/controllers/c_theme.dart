import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CTheme extends GetxController {
  int currentIndex = 0;

  late List<ThemeData> themeList = [_lightTheme, _darkTheme];

  ThemeData get currentTheme => themeList[currentIndex];
  Color backGroundColor = Colors.white;
  Color backGroundColorDark = Colors.black;

  void updateTheme({int? index}) async {
    currentIndex = index??(currentIndex == 0 ? 1 : 0);
    debugPrint(currentIndex.toString());
    update();
    // SharedPrefService.instance.setInt(PKeys.themeIndex, index);
  }

  late final ThemeData _lightTheme = ThemeData(
    // ▶️ Core Configuration
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: backGroundColor,
    splashColor: const Color(0xFF6F23FD).withValues(alpha: 0.1),
    highlightColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    canvasColor: Colors.black.withValues(alpha: 0.05),
    dividerColor: Colors.grey[300],

    // ▶️ AppBar Theme
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.black),
      // titleTextStyle: TextStyle(
      //   color: Colors.black,
      //   fontWeight: FontWeight.w600,
      //   fontSize: 20.sp,
      // ),
    ),

    // ▶️ Drawer Theme
    drawerTheme: const DrawerThemeData(scrimColor: Colors.white),

    // ▶️ Text Theme
    textTheme: TextTheme(
      // bodyLarge: TextStyle(
      //   color: const Color(0xFF292929),
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // bodyMedium: TextStyle(
      //   color: Colors.white,
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // bodySmall: TextStyle(
      //   color: const Color(0xff34C759),
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // displayLarge: TextStyle(
      //   color: Colors.black54,
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // displaySmall: TextStyle(
      //   color: Colors.black,
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w400,
      // ),
    ),

    // ▶️ Input Field Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      // hintStyle: TextStyle(
      //   color: const Color(0xFFA0A0A0),
      //   fontSize: 15.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // errorStyle: TextStyle(
      //   color: Colors.red,
      //   fontSize: 12.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(PDimension.boarderRadius)),
      //   borderSide: const BorderSide(color: Color(0xFF8391A1), width: 0.5),
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(PDimension.boarderRadius)),
      //   borderSide: const BorderSide(color: Color(0xFF8391A1), width: 0.5),
      // ),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(PDimension.boarderRadius)),
      //   borderSide: const BorderSide(color: Color(0xFF8391A1), width: 0.5),
      // ),
      // errorBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(PDimension.boarderRadius)),
      //   borderSide: const BorderSide(color: Color(0xFF8391A1), width: 0.5),
      // ),
      // disabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(PDimension.boarderRadius)),
      //   borderSide: const BorderSide(color: Color(0xFF8391A1), width: 0.5),
      // ),
      // focusedErrorBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(Radius.circular(PDimension.boarderRadius)),
      //   borderSide: const BorderSide(color: Color(0xFF8391A1), width: 0.5),
      // ),
    ),

    // ▶️ Button Theme
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF002E5B),
        secondary: const Color(0xFF3AADE1),
        tertiary: Colors.white,
        shadow: Colors.grey.withValues(alpha: 0.1),
      ),
      highlightColor: Colors.white,
    ),

    // ▶️ Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        // padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
        //   EdgeInsets.symmetric(horizontal: 12.w),
        // ),
        side: const WidgetStatePropertyAll<BorderSide>(BorderSide(width: 1.0)),
        backgroundColor: const WidgetStatePropertyAll<Color?>(
          Colors.transparent,
        ),
      ),
    ),
  );

  late final ThemeData _darkTheme = ThemeData(
    // ▶️ Core Configuration
    brightness: Brightness.dark,
    scaffoldBackgroundColor: backGroundColorDark,
    splashColor: const Color(0xFF6F23FD).withValues(alpha: 0.1),
    highlightColor: Colors.transparent,
    splashFactory: InkRipple.splashFactory,
    primaryColor: Colors.black,
    dividerColor: Colors.grey[300],
    cardColor: Colors.black,

    // ▶️ Drawer Theme
    drawerTheme: const DrawerThemeData(scrimColor: Colors.white),

    // ▶️ Text Theme
    textTheme: TextTheme(
      // bodyLarge: TextStyle(
      //   color: Colors.white,
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // bodyMedium: TextStyle(
      //   color: Colors.black,
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // bodySmall: TextStyle(
      //   color: const Color(0xff34C759),
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // displayLarge: TextStyle(
      //   color: Colors.white70,
      //   fontSize: 14.sp,
      //   fontWeight: FontWeight.w400,
      // ),
    ),

    // ▶️ Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      // errorStyle: TextStyle(
      //   color: Colors.red,
      //   fontSize: 12.sp,
      //   fontWeight: FontWeight.w400,
      // ),
      // contentPadding: EdgeInsets.symmetric(horizontal: PDimension.paddingX),
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(PDimension.boxRadius),
      //   borderSide: BorderSide.none,
      // ),
      // focusedBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(PDimension.boxRadius),
      //   borderSide: BorderSide.none,
      // ),
      // enabledBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(PDimension.boxRadius),
      //   borderSide: BorderSide.none,
      // ),
    ),

    // ▶️ Button Theme
    buttonTheme: ButtonThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(0xFF002E5B),
        secondary: const Color(0xFF3AADE1),
        tertiary: Colors.white,
        shadow: Colors.grey.withValues(alpha: 0.1),
      ),
      highlightColor: Colors.white,
    ),

    // ▶️ Outlined Button Theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color?>(
          const Color(0xFF6F23FD).withValues(alpha: 0.2),
        ),
      ),
    ),
  );
}


// import 'package:boilerplate/core/constants/keys.dart';
// import 'package:boilerplate/core/services/shared_preference_service.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter/material.dart';
// import 'package:boilerplate/core/constants/colors.dart';
// import 'package:boilerplate/core/constants/dimension_theme.dart';
// import 'package:momo/core/constants/colors.dart';
// import 'package:momo/core/constants/dimension_theme.dart';
// import 'package:power_state/power_state.dart';

// /// 🎨 Manages theme switching and holds theme definitions (light/dark)
// class CTheme extends PowerController {
//   int _currentIndex = 0;

//   /// 🌓 List of available themes
//   late List<ThemeData> themeList = [_lightTheme, _darkTheme];

//   /// 🌈 Currently active theme
//   ThemeData get currentTheme => themeList[_currentIndex];

//   /// 🔄 Updates active theme
//   void updateTheme({int? value}) async {
//     _currentIndex = value ?? (_currentIndex == 0 ? 1 : 0);
//     await SharedPrefService.instance.setInt(PKeys.themeIndex, _currentIndex);
//     notifyListeners();
//   }

//   //☀️ Light Theme //
//   late final ThemeData _lightTheme = ThemeData(
//     // ▶️ Core Identity
//     brightness: Brightness.light,
//     useMaterial3: true,

//     // ▶️ Backgrounds & Surface
//     scaffoldBackgroundColor: PColors.backGroundColorLight,
//     primaryColor: PColors.primaryColor,
//     dividerColor: PColors.dividerColorLight,
//     tabBarTheme: TabBarThemeData(
//       indicatorColor: Colors.white,
//     ),
//     cardColor: PColors.primaryColor.withValues(alpha: 0.1),

//     // ▶️ AppBar
//     appBarTheme: AppBarTheme(
//         titleTextStyle: TextStyle(
//             fontSize: 15.sp,
//             fontWeight: FontWeight.w500,
//             color: PColors.primayTextColorLight)),

//     // ▶️ Buttons
//     buttonTheme: ButtonThemeData(
//       colorScheme: ColorScheme.fromSeed(
//         primary: PColors.primaryColor,
//         seedColor: PColors.primaryColor,
//         secondary: PColors.primaryColor,
//       ),
//     ),

//     // ▶️ Radio Buttons
//     radioTheme: RadioThemeData(
//         fillColor: WidgetStateProperty.all(PColors.primaryColor)),

//     // ▶️ Typography - 4 Different colors including white colors in the Heading
//     textTheme: TextTheme(
//       titleLarge: TextStyle(
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w600,
//           color: PColors.primayTextColorLight),
//       titleMedium: TextStyle(
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w400,
//           color: PColors.primayTextColorLight),
//       titleSmall: TextStyle(
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w300,
//           color: PColors.primayTextColorLight),
//       bodyLarge: TextStyle(
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w600,
//           color: PColors.secondaryTextColorLight),
//       bodyMedium: TextStyle(
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w400,
//           color: PColors.secondaryTextColorLight),
//       bodySmall: TextStyle(
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w300,
//           color: PColors.secondaryTextColorLight),
//       displayLarge: TextStyle(
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w600,
//           color: PColors.additionalTextColorLight),
//       displayMedium: TextStyle(
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w400,
//           color: PColors.additionalTextColorLight),
//       displaySmall: TextStyle(
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w300,
//           color: PColors.additionalTextColorLight),
//       labelSmall: TextStyle(
//         fontSize: 12.sp,
//         fontWeight: FontWeight.w400,
//         color: PColors.primayTextColorLight,
//       ),
//       headlineLarge: TextStyle(
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w600,
//           color: PColors.primayTextColorDark),
//       headlineMedium: TextStyle(
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w400,
//           color: PColors.primayTextColorDark),
//       headlineSmall: TextStyle(
//         fontSize: 12.sp,
//         fontWeight: FontWeight.w300,
//         color: PColors.primayTextColorDark,
//       ),
//     ),

//     // ▶️ Input Fields (TextFormField, etc.)
//     inputDecorationTheme: InputDecorationTheme(
//       // fillColor: PColors.primaryColor.withValues(alpha: 0.05),
//       fillColor: Colors.white,
//       filled: true,
//       hintStyle: TextStyle(
//         fontSize: 12.sp,
//         fontWeight: FontWeight.w300,
//         color: PColors.secondaryTextColorLight,
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8.r)),
//         borderSide: BorderSide(color: PColors.borderColorDark, width: 1.5),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8.r)),
//         borderSide: BorderSide(color: PColors.borderColorDark, width: 1.5),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8.r)),
//         borderSide: BorderSide(color: PColors.borderColorDark, width: 1.5),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8.r)),
//         borderSide: BorderSide(color: Colors.red, width: 1.5),
//       ),
//       disabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8.r)),
//         borderSide: BorderSide(color: PColors.borderColorDark, width: 1.5),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(8.r)),
//         borderSide: BorderSide(color: Colors.red, width: 1.5),
//       ),
//     ),
//   );

//   //🌑 Dark Theme //

//   late final ThemeData _darkTheme = ThemeData(
//     brightness: Brightness.dark,
//     useMaterial3: true,
//     // ▶️ Backgrounds & Surface
//     scaffoldBackgroundColor: Colors.black,
//     primaryColor: PColors.primaryColor,
//     dividerColor: PColors.dividerColorDark,
//     tabBarTheme: TabBarThemeData(
//       indicatorColor: const Color(0xFF121212),
//     ),
//     cardColor: Colors.grey[850], // darker card surface

//     // ▶️ AppBar
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.black,
//       elevation: 0,
//       iconTheme: IconThemeData(color: Colors.white),
//       titleTextStyle: TextStyle(
//           fontSize: 15.sp,
//           fontWeight: FontWeight.w500,
//           color: PColors.primayTextColorDark),
//     ),

//     // ▶️ Buttons
//     buttonTheme: ButtonThemeData(
//       colorScheme: ColorScheme.fromSeed(
//         brightness: Brightness.dark,
//         seedColor: PColors.primaryColor,
//         primary: PColors.primaryColor,
//         secondary: Color.alphaBlend(
//             Colors.white.withValues(alpha: 0.2), PColors.primaryColor),
//       ),
//     ),

//     // ▶️ Radio Buttons
//     radioTheme: RadioThemeData(
//         fillColor: WidgetStateProperty.all(PColors.primaryColor)),

//     // ▶️ Typography
//     textTheme: TextTheme(
//       titleLarge: TextStyle(
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w600,
//           color: PColors.primayTextColorDark),
//       titleMedium: TextStyle(
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w400,
//           color: PColors.primayTextColorDark),
//       titleSmall: TextStyle(
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w300,
//           color: PColors.primayTextColorDark),
//       bodyLarge: TextStyle(
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w600,
//           color: PColors.secondaryTextColorLight),
//       bodyMedium: TextStyle(
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w400,
//           color: PColors.secondaryTextColorLight),
//       bodySmall: TextStyle(
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w300,
//           color: PColors.secondaryTextColorLight),
//       displayLarge: TextStyle(
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w600,
//           color: PColors.additionalTextColorLight),
//       displayMedium: TextStyle(
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w400,
//           color: PColors.additionalTextColorLight),
//       displaySmall: TextStyle(
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w300,
//           color: PColors.additionalTextColorLight),
//       labelSmall: TextStyle(
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w600,
//           color: PColors.primayTextColorDark),
//       headlineLarge: TextStyle(
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w600,
//           color: PColors.primayTextColorDark),
//       headlineMedium: TextStyle(
//           fontSize: 14.sp,
//           fontWeight: FontWeight.w400,
//           color: PColors.primayTextColorDark),
//       headlineSmall: TextStyle(
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w300,
//           color: PColors.primayTextColorDark),
//     ),

//     // ▶️ Input Fields
//     inputDecorationTheme: InputDecorationTheme(
//       fillColor: Color(0xFF121212),
//       filled: true,
//       hintStyle: TextStyle(
//           color: Color(0xFFE6E6E6),
//           fontSize: 12.sp,
//           fontWeight: FontWeight.w300),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(PTheme.boarderRadius)),
//         borderSide: BorderSide(color: PColors.borderColorDark, width: 0.5),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(PTheme.boarderRadius)),
//         borderSide: BorderSide(color: PColors.borderColorDark, width: 0.5),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(PTheme.boarderRadius)),
//         borderSide: BorderSide(color: PColors.borderColorDark, width: 0.5),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(PTheme.boarderRadius)),
//         borderSide: BorderSide(color: Colors.red, width: 1),
//       ),
//       disabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(PTheme.boarderRadius)),
//         borderSide: BorderSide(color: PColors.borderColorDark, width: 0.5),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.all(Radius.circular(PTheme.boarderRadius)),
//         borderSide: BorderSide(color: Colors.red, width: 1),
//       ),
//     ),
//   );
// }
