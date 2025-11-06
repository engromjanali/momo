import 'package:momo/core/data/model/m_profile_item.dart';

import './/core/constants/dimension_theme.dart';
import './/core/extensions/ex_build_context.dart';
import './/core/extensions/ex_padding.dart';
import './/core/widgets/w_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WMenuList extends StatelessWidget {
  final String label;
  final List<MProfileItem> list;
  final Function(int)? onTap;
  final bool isSettingScreen;
  const WMenuList({
    super.key,
    required this.list,
    required this.onTap,
    required this.label,
    this.isSettingScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        Text(
          label,
          style: context.textTheme?.titleLarge?.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15.sp,
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            final MProfileItem data = list[index];
            return WContainer(
              isSettingScreen: isSettingScreen,
              borderColor: Colors.white12,
              onTap: () {
                onTap?.call(index);
              },
              verticalPadding: PTheme.spaceY,
              horizontalPadding: PTheme.spaceX,
              boxShadow: [
                BoxShadow(
                  color:
                      context.primaryTextColor!,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color:
                      context.secondaryTextColor!,
                  offset: Offset(0.5, 0.5),
                  blurRadius: 2,
                  spreadRadius: 0,
                ),
              ],
              child: Row(
                spacing: 10.r,
                children: [
                  if (data.logo != null)
                    SvgPicture.asset(
                      data.logo!,
                      height: 20.w,
                      width: 20.w,
                      colorFilter: ColorFilter.mode(
                          context.secondaryTextColor!, BlendMode.srcIn),
                    ),
                  Expanded(
                    child: Text(
                      data.title ?? "",
                      style: context.textTheme?.titleMedium,
                    ),
                  ),
                  if (data.trailing != null) data.trailing!,
                  if (data.trailing == null)
                    Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20.w,
                    ).pH(),
                ],
              ).pAll(value: 8),
            ).pV(value: 5);
          },
        ),
      ],
    );
  }
}

// class WSettingMenuList extends StatelessWidget {
//   final String label;
//   final List<MOtherItem> list;
//   final Function(int)? onTap;
//   const WSettingMenuList({
//     super.key,
//     required this.list,
//     required this.onTap,
//     required this.label,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       spacing: 10.h,
//       children: [
//         Text(
//           label,
//           style: context.primaryTextLarge?.copyWith(
//             fontWeight: FontWeight.w400,
//             fontSize: 15.sp,
//           ),
//         ),
//         ListView.builder(
//           padding: EdgeInsets.zero,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: list.length,
//           itemBuilder: (BuildContext context, int index) {
//             final MOtherItem data = list[index];
//             return WContainer(
//               isSettingScreen: true,
//               borderColor: Colors.white12,
//               onTap: () {
//                 onTap?.call(index);
//               },
//               verticalPadding: PTheme.spaceY,
//               horizontalPadding: PTheme.spaceX,
//               boxShadow: [
//                 BoxShadow(
//                   color:
//                       context.primaryTextLarge!.color!.withValues(alpha: 0.08),
//                   offset: Offset(1, 1),
//                   blurRadius: 2,
//                   spreadRadius: 0,
//                 ),
//                 BoxShadow(
//                   color:
//                       context.primaryTextLarge!.color!.withValues(alpha: 0.08),
//                   offset: Offset(0.5, 0.5),
//                   blurRadius: 2,
//                   spreadRadius: 0,
//                 ),
//               ],
//               child: Row(
//                 spacing: 10.r,
//                 children: [
//                   if (list[index].logo != null)
//                     SvgPicture.asset(
//                       data.logo!,
//                       height: 20.w,
//                       width: 20.w,
//                       colorFilter: ColorFilter.mode(
//                           context.primaryTextLarge!.color!, BlendMode.srcIn),
//                     ),
//                   Expanded(
//                     child: Text(
//                       data.title ?? "",
//                       style: context.textTheme?.titleMedium,
//                     ),
//                   ),
//                   if (data.trailing != null) data.trailing!,
//                 ],
//               ).pAll(value: 8),
//             ).pV(value: 5);
//           },
//         ),
//       ],
//     );
//   }
// }
