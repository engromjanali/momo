import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:momo/core/constants/dimension_theme.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/image/m_image_payload.dart';
import 'package:momo/core/widgets/image/w_image.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
import 'package:momo/features/explore/view/upload/view/s_share.dart';
import 'package:momo/gen/assets.gen.dart';

class SSave extends StatefulWidget {
  const SSave({super.key});

  @override
  State<SSave> createState() => _SSaveState();
}

class _SSaveState extends State<SSave> {
  final List<String> filterList = [
    Assets.images.good.a1.path,
    Assets.images.good.a2.path,
    Assets.images.good.a3.path,
    Assets.images.good.a4.path,
    Assets.images.good.a5.path,
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.photo))],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox.expand(
                      child: Image.asset(
                        filterList[selectedIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: -20,
                      bottom: 40,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: context.cardColor,
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              height: 20.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  "HD",
                                  style: context.textTheme?.titleSmall
                                      ?.copyWith(color: Colors.indigoAccent),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: context.cardColor,
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(Assets.icons.afterBefore),
                          ),
                        ],
                      ),
                    ),

                    // MomoLabel(),
                  ],
                ),
              ),
            ),

            // filter list  as list-view
            SizedBox(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox.square(
                    dimension: 110.w,
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.cardColor,
                        border: Border.all(
                          color: context.secondaryTextColor ?? Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(
                          PTheme.boarderRadius,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.icons.dashicons,
                              height: 30.h,
                              colorFilter: ColorFilter.mode(
                                context.primaryTextColor ?? Colors.green,
                                BlendMode.srcIn,
                              ),
                            ).pB(),
                            Text(
                              "Custom",
                              style: context.textTheme?.titleSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Container(
                      height: 50.h,
                      width: 1.w,
                      color: context.secondaryTextColor,
                    ),
                  ).pH(),
                  Expanded(
                    child: StatefulBuilder(
                      builder: (context, setLocalState) {
                        return ListView.builder(
                          itemCount: filterList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: SizedBox(
                                width: 110.w,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox.square(
                                      dimension: 110.w,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadiusGeometry.circular(
                                              PTheme.boarderRadius,
                                            ),
                                        child: Image.asset(
                                          filterList[index],
                                          fit: BoxFit.cover,
                                          // payload: MImagePayload(
                                          //   fit: BoxFit.fill,
                                          // ),
                                        ),
                                      ),
                                    ),
                                    if (selectedIndex == index)
                                      Icon(
                                        Icons.circle,
                                        color: context.primaryTextColor,
                                        size: 10.w,
                                      ),
                                  ],
                                ),
                              ).pR(),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // bottom section
            Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.update, color: Colors.white),
                    Text("Rest All", style: TextStyle(color: Colors.white)),
                  ],
                ),
                Expanded(
                  child: WBottomNavButton(
                    label: "Save",
                    ontap: () {
                      SShare().push();
                    },
                  ).pAll(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
