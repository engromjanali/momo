import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/image/w_image.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
import 'package:momo/core/widgets/w_pop_button.dart';
import 'package:momo/core/widgets/w_select_ai_profile_type.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';
import 'package:momo/features/explore/view/s_upload.dart';
import 'package:momo/gen/assets.gen.dart';

class SGetStarted extends StatefulWidget {
  final ImageType? imageType;
  final EItem? eItem;
  const SGetStarted({super.key, this.imageType, this.eItem});

  @override
  State<SGetStarted> createState() => _SGetStartedState();
}

class _SGetStartedState extends State<SGetStarted> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness
            .dark, // for ios, “The background of my status bar is dark, so please show light icons/text (white)”.
        statusBarIconBrightness:
            Brightness.light, // for android color, mean foreground color white
      ),
    );

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Colors.black,

        bottomNavigationBar: WBottomNavButton(
          label: "Get Stared",
          ontap: () {
            SUpload(eItem: widget.eItem).pushReplacement();
          },
        ).pAll(),
        body: Column(
          children: [
            // top area
            Expanded(
              flex: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // left blank area with close button/icon
                  SizedBox(
                    width: 60.w,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: WPButton(
                        onTap: () {
                          Navigation.pop();
                        },
                      ),
                    ),
                  ),
                  // top image section
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox.expand(
                        child: WImage(
                          isNotNull(widget.eItem?.images)
                              ? widget.eItem?.images?.first
                              : null,
                          // fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // right bnank area
                  gapX(60),
                ],
              ),
            ),

            // down area
            Expanded(
              flex: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("How it Work?", style: context.textTheme?.titleLarge),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: context.cardColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Icon(Icons.stars_rounded, color: Colors.white),
                            Expanded(
                              child: Text(
                                "Ai Analizesyour apperance to create personalized photo and video content",
                                style: context.textTheme?.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Colors.grey),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Icon(
                              Icons.photo_library_sharp,
                              color: Colors.white,
                            ),
                            Expanded(
                              child: Text(
                                "Upload your photo to build your ai profile and start genarating unique creation.",
                                style: context.textTheme?.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ).pAll(),
                  ),

                  Spacer(),
                  gapY(80),
                ],
              ).pAll(),
            ),
          ],
        ),
      ),
    );
  }
}
