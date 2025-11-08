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
import 'package:momo/core/services/image_picker_services.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
import 'package:momo/core/widgets/w_cancle_button.dart';
import 'package:momo/core/widgets/w_card.dart';
import 'package:momo/core/widgets/w_container.dart';
import 'package:momo/core/widgets/w_purchese.dart';
import 'package:momo/features/explore/view/upload/data/model/m_selected_image.dart';
import 'package:momo/features/explore/view/upload/widget/w_selected_image.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';
import 'package:momo/features/oneshot/widgets/w_dialog.dart';
import 'package:momo/gen/assets.gen.dart';

class SPhotosWithPrompt extends StatefulWidget {
  final OItem osItem;
  const SPhotosWithPrompt({super.key, required this.osItem});

  @override
  State<SPhotosWithPrompt> createState() => _PhotosWithPromptState();
}

class _PhotosWithPromptState extends State<SPhotosWithPrompt> {
  List<MSImage?> pickedImageList = [];
  TextEditingController promptController = TextEditingController();

  @override
  void initState() {
    promptController.text = widget.osItem.prompt!;
    pickedImageList.addAll(
      (widget.osItem.imageBehaildText ?? []).map((x) => MSImage()).toList(),
    );
    // TODO: implement initState
    super.initState();
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
        isEnabled: !pickedImageList.contains(null),
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
                  child: Image.asset(Assets.images.x.path, fit: BoxFit.fill),
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
                Positioned(
                  top: 10,
                  left: 20,
                  child: SafeArea(
                    child: WCancleButton(
                      onTap: () {
                        Navigation.pop();
                      },
                    ),
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
                      spacing: PTheme.spaceX,
                      children: (widget.osItem.imageBehaildText ?? []).map((
                        behindText,
                      ) {
                        int index = (widget.osItem.imageBehaildText ?? [])
                            .indexOf(behindText);
                        return Expanded(
                          child: WSelectedImage(
                            msImage: pickedImageList[index],
                            onTap: () async {
                              if (!isNull(pickedImageList[index])) {
                                setState(() {
                                  pickedImageList[index] = null;
                                });
                              } else {
                                ImageSource? res = await WISDialog().push();
                                if (!isNull(res)) {
                                  XFile? pickedImageFile = await SvImagePicker()
                                      .pickSingleImage(
                                        choseFrom: res ?? ImageSource.gallery,
                                      );
                                  if (!isNull(pickedImageFile)) {
                                    setState(() {
                                      pickedImageList[index] = MSImage(
                                        image: pickedImageFile?.path,
                                      );
                                    });
                                  }
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
