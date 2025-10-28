import 'dart:io';

import 'package:flutter/material.dart';
import 'package:momo/core/asset_manager/assets/images.dart';
import 'package:momo/core/util/constants/colors.dart';
import 'package:momo/core/util/constants/text_style.dart';
import 'package:momo/core/widgets/w_upolad/data/model/m_good_image.dart';

Widget getImageCard({
  required Function(bool) ontap, // true if iamge have otherwise false.
  required MGoodImage image,
  required String label,
}) {
  return Container(
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
      color: Colors.white10,
      borderRadius: BorderRadius.circular(10),

      // image: DecorationImage(image: ,fit: BoxFit.fill,))
    ),
    child: image.image != null
        ?
          // show image
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: image.isGoodImage ?? false
                      ? BoxBorder.all(
                          color: Colors.red,
                          width: 2,
                          strokeAlign: BorderSide.strokeAlignInside,
                        )
                      : null,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox.expand(
                    child: Image.file(
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.person),
                      File(image.image ?? ""),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
              ),

              Positioned.fill(
                child: Container(
                  color: image.isGoodImage ?? false
                      ? Colors.red.withAlpha(50)
                      : null,
                ),
              ),
              Positioned(
                top: 3,
                right: 3,
                child: IconButton(
                  onPressed: () {
                    ontap(true);
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: image.isGoodImage ?? false
                        ? Colors.red
                        : Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ],
          )
        :
          // otherwise show image field
          GestureDetector(
            onTap: () {
              ontap(false);
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
                      size: 40,
                      color: MyColor.grey,
                    ),
                    Text(
                      label,
                      style: getSubtitleStyleL(),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
  );
}
