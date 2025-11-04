import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/constants/colors.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/widgets/image/w_image.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';

class WExploreList extends StatelessWidget {
  final MExplore mExplore;
  const WExploreList({super.key, required this.mExplore});

  @override
  build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                mExplore.title ?? PDefaultValues.noName,
                style: context.textTheme?.titleLarge,
              ),
              GestureDetector(
                onTap: () {
                  // Get.to(() => SeeAllPage(explore: explore));
                },
                child: Text("See All", style: context.textTheme?.bodyLarge),
              ),
            ],
          ),
        ),

        // explore item list
        SizedBox(
          height: 210.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mExplore.items?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: WExploreItem(eItem: mExplore.items![index]),
              );
            },
          ),
        ),
      ],
    );
  }
}

class WExploreItem extends StatelessWidget {
  final EItem eItem;
  const WExploreItem({super.key, required this.eItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(() => GetThisPack(eItem: eItem));
      },
      child: Stack(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 200.h,
                width: 150.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: WImage(eItem.images?.first ?? ""),
                ),
              ),
              Container(
                height: 200.h,
                width: 150.w,

                decoration: BoxDecoration(
                  gradient: PColors.imageFG,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),

          Positioned(
            bottom: 8,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  eItem.title ?? PDefaultValues.noName,
                  textAlign: TextAlign.center,
                  style: context.textTheme?.titleMedium,
                ),
                Text(
                  "${eItem.images?.length ?? PDefaultValues.noName} Photos",
                  textAlign: TextAlign.center,
                  style: context.textTheme?.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
