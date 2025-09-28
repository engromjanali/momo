import 'dart:ui';

import 'package:flutter/material.dart';

Widget glassWidget({BoxBorder? border,EdgeInsets?padding, required Widget child, BorderRadius? borderRadius})
{
  return ClipRRect(
    borderRadius: borderRadius??BorderRadius.zero,
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
            )
    ),
  );
}