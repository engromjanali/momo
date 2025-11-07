import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/functions/f_printer.dart';
import 'package:momo/features/explore/view/upload/data/model/m_selected_image.dart';

class WSelectedImage extends StatelessWidget {
  final Function() onTap;
  final MSImage? msImage;
  final String? label;
  const WSelectedImage({super.key, required this.onTap, required this.msImage, this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(10),

        // image: DecorationImage(image: ,fit: BoxFit.fill,))
      ),
      child: !isNull(msImage?.image)
          ?
            // show image
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: msImage?.isGoodImage ?? false
                        ? null
                        : BoxBorder.all(
                            color: Colors.red,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside,
                          ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox.expand(
                      child: Image.file(
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.person),
                        File(msImage?.image ?? ""),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Container(
                    color: msImage?.isGoodImage ?? false
                        ? null
                        : Colors.red.withAlpha(70),
                  ),
                ),
                Positioned(
                  top: 3,
                  right: 3,
                  child: IconButton(
                    onPressed: () {
                      onTap();
                    },
                    icon: Icon(
                      Icons.cancel,
                      color: msImage?.isGoodImage ?? false
                          ? Colors.white
                          : Colors.red,
                      size: 25,
                    ),
                  ),
                ),
              ],
            )
          : // otherwise show image field
            GestureDetector(
              onTap: () {
                printer("add image");
                onTap.call();
              },
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.all(10),
                child: SizedBox.expand(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_search_sharp,
                        size: 40.w,
                        color: context.secondaryTextColor,
                      ),
                      Text(
                        label ?? "Add Image",
                        style: context.textTheme?.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
