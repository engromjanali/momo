import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momo/core/constants/colors.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/constants/dimension_theme.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/functions/f_pick_single_image.dart';
import 'package:momo/core/services/face_detection_service.dart';
import 'package:momo/core/services/image_picker_services.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/image/m_image_payload.dart';
import 'package:momo/core/widgets/image/w_image.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
import 'package:momo/core/widgets/w_pop_button.dart';
import 'package:momo/core/widgets/w_card.dart';
import 'package:momo/core/widgets/w_container.dart';
import 'package:momo/core/widgets/w_purchese.dart';
import 'package:momo/features/explore/data/selected_images.dart';
import 'package:momo/features/explore/data/model/m_selected_image.dart';
import 'package:momo/features/explore/widget/w_selected_image.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';
import 'package:momo/core/widgets/w_image_source_dialog.dart';
import 'package:momo/gen/assets.gen.dart';

class SPhotosWithPrompt extends StatefulWidget {
  final OItem osItem;
  const SPhotosWithPrompt({super.key, required this.osItem});

  @override
  State<SPhotosWithPrompt> createState() => _PhotosWithPromptState();
}

class _PhotosWithPromptState extends State<SPhotosWithPrompt> {
  TextEditingController promptController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    promptController.text = widget.osItem.prompt ?? "";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    selectedImageList.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      bottomNavigationBar: WBottomNavButton(
        label: "Continue * 10",
        ontap: () {
          WPurchese().push();
        },
        isEnabled: selectedImageList.any((MSImage e) => e.isGoodImage ?? false),
      ).pAll(),
      body: Column(
        children: [
          // top area
          Expanded(
            flex: 50,
            child: Stack(
              children: [
                // image
                SizedBox.expand(
                  child: WImage(
                    widget.osItem.image,
                    payload: MImagePayload(fit: BoxFit.fill),
                  ),
                ),
                // top color shadow
                Positioned(
                  child: Container(
                    decoration: BoxDecoration(gradient: PColors.imageFG),
                  ),
                ),
                // text
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.osItem.title ?? PDefaultValues.noName,
                          style: context.textTheme?.titleMedium,
                        ),
                        Text(
                          widget.osItem.subTitle ?? PDefaultValues.noName,
                          style: context.textTheme?.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                // close icon
                SafeArea(
                  child: WPButton(
                    onTap: () {
                      Navigation.pop();
                    },
                  ),
                ),
              ],
            ),
          ),

          // down area
          Expanded(
            flex: 50,
            child: Container(
              color: Colors.black,
              child: Column(
                spacing: PTheme.spaceY,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: context.cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: WPromptField(
                        title: "Enter Prompt",
                        promptController: promptController,
                        isExpanded: true,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: PTheme.spaceX,

                      children: (widget.osItem.imageBehaildText ?? []).map((
                        behindText,
                      ) {
                        int index = (widget.osItem.imageBehaildText ?? [])
                            .indexOf(behindText);
                        return Expanded(
                          child: WSelectedImage(
                            msImage: index >= selectedImageList.length
                                ? null
                                : selectedImageList[index],
                            onTap: () async {
                              if (index < selectedImageList.length) {
                                setState(() {
                                  selectedImageList.removeAt(index);
                                });
                              } else {
                                MSImage? msImage = await pickSingleImage();

                                if (!isNull(msImage)) {
                                  setState(() {
                                    selectedImageList.add(msImage ?? MSImage());
                                  });
                                }
                              }
                            },
                            label: behindText,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ).pAll(),
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}

class WPromptField extends StatelessWidget {
  final bool isExpanded;
  final String title;
  final TextEditingController promptController;
  const WPromptField({
    super.key,
    this.isExpanded = false,
    required this.title,
    required this.promptController,
  });

  @override
  Widget build(BuildContext context) {
    return WCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: context.textTheme?.titleSmall).pB(),
          Expanded(
            child: TextField(
              controller: promptController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.transparent,
                hintText: "Write Your Prompt Here...",
                hintStyle: context.textTheme?.bodyMedium,
                contentPadding: EdgeInsets.all(0),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
              ),

              style: context.textTheme?.bodyMedium,
              textAlign: TextAlign
                  .start, // Align text horizontally to the start (left)
              textAlignVertical:
                  TextAlignVertical.top, // Align text vertically to the top
              expands: isExpanded,
              scrollPhysics: const ClampingScrollPhysics(),
              maxLines: isExpanded ? null : 1,
            ),
          ),
        ],
      ).pAll(),
    );
  }
}
