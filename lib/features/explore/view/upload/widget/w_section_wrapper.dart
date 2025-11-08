import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/constants/dimension_theme.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/features/explore/view/upload/widget/w_good_and_bad_image.dart';

/// if you we purse [isGood] it's show good/bad image listview.
/// other wise show selected image.
class WSectionWrapper extends StatelessWidget {
  final bool? isGood;
  final String title;
  final String? subtitle;
  final List<String>? imageList;
  final Widget? child;
  const WSectionWrapper({
    super.key,
    this.isGood,
    required this.title,
    this.subtitle,
    this.imageList,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: PTheme.spaceX,
          children: [
            if (!isNull(isGood))
              Icon(
                isGood ?? false ? Icons.check_circle : Icons.cancel,
                size: 16,
                color: isGood ?? false ? Colors.green : Colors.red,
              ),
            Text(title, style: context.textTheme?.titleLarge),
          ],
        ),
        if (!isNull(isGood))
          Text(
            subtitle ?? PDefaultValues.noName,
            style: context.textTheme?.bodySmall,
          ),
        if (!isNull(isGood))
          SizedBox(
            height: 120.h,
            child: ListView.builder(
              itemCount: imageList?.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return SizedBox(
                  width: 120.h,
                  height: 120.h,
                  child: WGABImage(
                    image: imageList?[index] ?? "No-Image",
                    isGood: isGood ?? false,
                  ),
                ).pR();
              },
            ),
          ).pV(),
        if (!isNull(child)) child ?? SizedBox.shrink(),
      ],
    );
  }
}
