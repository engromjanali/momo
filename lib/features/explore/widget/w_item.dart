import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/constants/colors.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/widgets/image/m_image_payload.dart';
import 'package:momo/core/widgets/image/w_image.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';

class WItem extends StatelessWidget {
  final EItem? eItem;
  final bool isExplore;
  final OItem? oItem;
  final Function() onTap;
  const WItem({
    super.key,
    this.eItem,
    required this.isExplore,
    this.oItem,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (isNull(eItem) && isNull(oItem)) {
      return WImage("Error");
    }
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 200.h,
                width: 150.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: WImage(
                    isExplore ? eItem?.images?.first : oItem?.image,
                    payload: MImagePayload(fit: BoxFit.fill),
                  ),
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

              Positioned(
                bottom: 8,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      isExplore
                          ? eItem?.title ?? PDefaultValues.noName
                          : oItem?.title ?? PDefaultValues.noName,
                      textAlign: TextAlign.center,
                      style: context.textTheme?.titleMedium,
                    ),
                    if (isExplore)
                      Text(
                        "${eItem?.images?.length ?? PDefaultValues.noName} Photos",
                        textAlign: TextAlign.center,
                        style: context.textTheme?.bodyMedium?.copyWith(
                          color: context.primaryTextColor,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
