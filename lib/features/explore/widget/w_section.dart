import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';
import 'package:momo/features/explore/view/s_get_this_pack.dart';
import 'package:momo/features/explore/view/s_see_all.dart';
import 'package:momo/features/explore/widget/w_item.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';
import 'package:momo/features/oneshot/function/f_upload_navigation.dart';
import 'package:momo/features/oneshot/view/s_photo_with_prompt.dart';

class WSection extends StatelessWidget {
  final MExplore? mExplore;
  final MOneshot? mOneshot;
  final bool isExplore;
  const WSection({
    super.key,
    this.mExplore,
    this.mOneshot,
    required this.isExplore,
  });

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
                isExplore
                    ? mExplore?.title ?? PDefaultValues.noName
                    : mOneshot?.title ?? PDefaultValues.noName,
                style: context.textTheme?.titleLarge,
              ),
              GestureDetector(
                onTap: () {
                  SSeeAll(
                    isExplore: isExplore,
                    explore: mExplore,
                    oneShot: mOneshot,
                  ).push();
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
            itemCount: isExplore
                ? mExplore?.items?.length ?? 0
                : mOneshot?.items?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: WItem(
                  onTap: () {
                    if (isExplore) {
                      SGetThisPack(eItem: mExplore?.items?[index]).push();
                    } else {
                      navigateToOSUploadScreen(mOneshot?.items?[index]);
                    }
                  },
                  oItem: mOneshot?.items?[index],
                  eItem: mExplore?.items?[index],
                  isExplore: isExplore,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
