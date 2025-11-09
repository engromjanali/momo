import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momo/core/constants/dimension_theme.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/functions/f_pick_single_image.dart';
import 'package:momo/core/functions/f_printer.dart';
import 'package:momo/core/functions/f_snackbar.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/w_card.dart';
import 'package:momo/core/widgets/w_select_ai_profile_type.dart';
import 'package:momo/features/explore/data/model/m_selected_image.dart';
import 'package:momo/core/widgets/w_image_source_dialog.dart';
import 'package:momo/features/profile/view/s_setting.dart';
import 'package:momo/features/s_home.dart';

class SProfile extends StatefulWidget {
  const SProfile({super.key});

  @override
  State<SProfile> createState() => _SProfileState();
}

class _SProfileState extends State<SProfile> {
  int selectedProfile = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              SSetting().push();
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        title: const Text("My Profile"),
      ),
      body: Column(
        children: [
          Divider(color: Colors.grey.withAlpha(50)),
          const SizedBox(height: 20),

          _WProfile(
            onTap: (value) {
              setState(() {
                selectedProfile = value;
              });
            },
            isAiProfile: selectedProfile == 0,
          ),

          // make it a section
          Expanded(
            child: selectedProfile == 0
                ? _WAIProfile(
                    onTap: () async {
                      ImageType? imageType = await showProfileTypeDialog(
                        context,
                      );
                      if (!isNull(imageType)) {
                        //  await pickSingleImage();
                      }
                      printer(imageType);
                    },
                  )
                : _WOneShot(
                    onTap: () {
                      SHome(selectedPage: 1).pushReplacement();
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _WProfile extends StatelessWidget {
  final double? width;
  final ValueChanged<int> onTap;
  final bool isAiProfile;
  const _WProfile({
    super.key,
    required this.onTap,
    required this.isAiProfile,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: width ?? 300.w,
      child: WCard(
        child: Stack(
          children: [
            /// Sliding highlight
            AnimatedAlign(
              alignment: isAiProfile
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
              child: Container(
                width: width ?? 300.w / 2, // half size
                decoration: BoxDecoration(
                  color: Colors.grey.withAlpha(150),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            /// Options Row
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      onTap.call(0);
                    },
                    child: Center(
                      child: Text(
                        "Ai Profile",
                        style: context.textTheme?.titleSmall,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      onTap.call(1);
                    },
                    child: Center(
                      child: Text(
                        "One Shot",
                        style: context.textTheme?.titleSmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WAIProfile extends StatelessWidget {
  final Function() onTap;
  const _WAIProfile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        // profile
        Stack(
          children: [
            Container(
              height: 100.w,
              width: 100.w,
              decoration: BoxDecoration(
                color: context.cardColor,
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xff2A2A2A), width: 1),
              ),
              child: Icon(Icons.person, size: 50, color: Colors.grey),
            ),
            Positioned(
              right: 8.w,
              bottom: 8.w,
              child: Container(
                height: 20.w,
                width: 20.w,
                decoration: BoxDecoration(
                  color: Color(0xff1F1F1F),
                  // border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(Icons.add, size: 20, color: Colors.black),
              ),
            ),
          ],
        ),
        // text---
        AutoSizeText(
          "Upload your photos to start using the app",
          textAlign: TextAlign.center,
          maxLines: 2,
          style: context.textTheme?.titleLarge,
          minFontSize: (16.sp).ceilToDouble(),
          overflow: TextOverflow.ellipsis,
        ).pAll(),

        Text(
          "You need to take this step only once",
          textAlign: TextAlign.center,
          maxLines: 2,
          style: context.textTheme?.bodyMedium,
          overflow: TextOverflow.ellipsis,
        ).pB(value: 22),

        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: context.primaryTextColor,
              borderRadius: BorderRadius.circular(PTheme.boarderRadius),
            ),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add Photos",
                  style: context.textTheme?.titleSmall?.copyWith(
                    color: context.backgroundColor,
                  ),
                ),
                Icon(Icons.add_circle, color: Colors.black),
              ],
            ),
          ),
        ),
        Spacer(),
        gapY(80),
      ],
    );
  }
}

class _WOneShot extends StatelessWidget {
  final Function() onTap;
  const _WOneShot({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image,
            color: context.secondaryTextColor,
            size: 80.w,
          ).pB(value: 20),

          Text(
            "You haven't created a \'One Shot\' yet",
            style: context.textTheme?.bodyLarge,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ).pB(value: 62),

          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                color: context.primaryTextColor,
                borderRadius: BorderRadius.circular(PTheme.boarderRadius),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Text(
                "Discover",
                style: context.textTheme?.titleSmall?.copyWith(
                  color: context.backgroundColor,
                ),
              ),
            ),
          ),
        ],
      ).pB(value: 100),
    );
  }
}
