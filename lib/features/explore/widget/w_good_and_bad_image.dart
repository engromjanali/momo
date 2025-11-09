import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/constants/dimension_theme.dart';

class WGABImage extends StatelessWidget {
  final String image;
  final bool isGood;
  const WGABImage({super.key, required this.image, required this.isGood});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child:
          // show image
          ClipRRect(
            borderRadius: BorderRadius.circular(PTheme.boarderRadius),
            child: Stack(
              children: [
                SizedBox.expand(
                  child: Image.asset(
                    image,
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Icon(
                    isGood ? Icons.check_circle : Icons.cancel,
                    color: isGood ? Colors.green : Colors.red,
                    size: 20.w,
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
