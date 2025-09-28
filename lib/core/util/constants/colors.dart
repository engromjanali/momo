import 'package:flutter/material.dart';

class MyColor{
  
  static const Color cardColor =  Color(0xFF141416);
  static const Color cardborderColor =  Color(0xFF303030);
  static const Color grey =  Color(0xFFAAAAAA);
  static const Color  white = Color(0xFFFFFFFF);

  static var proLinearGradient = LinearGradient(
    begin: AlignmentGeometry.topRight,
    end: AlignmentGeometry.bottomLeft,
    colors: [
      Color(0xFF01FD8C),
      Color(0xFF2FDFFF),
    ],
  );

  static var blackTransparentGradient = LinearGradient(
    begin: AlignmentGeometry.topCenter,
    end: AlignmentGeometry.bottomCenter,
    stops: [0.7, 1.0],
    colors: [
      Colors.transparent,
      Colors.black,
    ],
  );
}