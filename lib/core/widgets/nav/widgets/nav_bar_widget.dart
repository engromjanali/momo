import './/core/constants/colors.dart';
import './/core/constants/dimension_theme.dart';
import './/core/extensions/ex_build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/nav_bar_model.dart';
import 'w_nav_body.dart';

class WNavigationBar extends StatelessWidget {
  final List<NavigationBarItem> items;
  final int currentIndex;
  final Duration duration;
  final Curve curve;
  final Function(int index)? onChanged;

  const WNavigationBar({
    super.key,
    required this.items,
    this.curve = Curves.ease,
    required this.currentIndex,
    this.duration = const Duration(milliseconds: 500),
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: PTheme.spaceY),
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(16.r),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),

          color: context.theme.brightness == Brightness.dark
              ? Colors.black
              : PColors.primaryColor.withValues(alpha: 0.2),
          boxShadow: [
            BoxShadow(
              blurRadius: 0,
              spreadRadius: 0,
              offset: Offset(
                0,
                0,
              ),
              // color: context.primaryTextLarge!.color!.withValues(alpha: 0.08),
              color: context.theme.brightness == Brightness.dark
                  ? Colors.black
                  : PColors.primaryColor.withValues(alpha: 0.5),
            ),
          ],
        ),
        child: WBody(
          items: items,
          currentIndex: currentIndex,
          curve: curve,
          duration: duration,
          onTap: onChanged!,
        ),
      ),
    );
  }
}
