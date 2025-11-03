import './/core/constants/colors.dart';
import './/core/extensions/ex_build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/nav_bar_model.dart';

class WBody extends StatelessWidget {
  const WBody({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.curve,
    required this.duration,
    required this.onTap,
  });

  final List<NavigationBarItem> items;
  final int currentIndex;
  final Curve curve;
  final Duration duration;
  final Function(int index) onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        for (final item in items)
          Builder(
            builder: (_) {
              bool isIndex = items.indexOf(item) == currentIndex;
              return InkWell(
                onTap: () => onTap.call(items.indexOf(item)),
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                child: SvgPicture.asset(
                  isIndex ? item.icon : item.unSelectedIcon,
                  height: items.indexOf(item) == 2 ? 56.h : 25.h,
                  width: items.indexOf(item) == 2 ? 56.w : 25.w,
                  colorFilter: items.indexOf(item) == 2
                      ? null
                      : ColorFilter.mode(
                          isIndex
                              // ? PColors.primaryColor
                              ? context.theme.brightness == Brightness.dark
                                  ? PColors.primaryColor
                                  : context.fillColor!
                              // : context.primaryTextLarge!.color!,
                              // : context.primaryTextLarge!.color!,
                              : context.theme.brightness == Brightness.dark
                                  ? Colors.white
                                  : PColors.secondaryButtonColor,
                          BlendMode.srcIn,
                        ),
                ),
              );
            },
          ),
      ],
    );
  }
}
