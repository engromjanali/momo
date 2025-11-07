import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momo/core/constants/colors.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/services/image_picker_services.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
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
          // Get.to(() => PurcheseScreen());
        },
        isEnabled: !pickedImageList.contains(null),
      ),
      body: Column(
        children: [
          // top area
          Expanded(
            flex: 40,
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
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.osItem.title ?? PDefaultValues.noName,
                          style: context.textTheme?.titleMedium,
                        ),
                        Text(
                          widget.osItem.subTitle ?? PDefaultValues.noName,
                          style: context.textTheme?.bodySmall,
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
                    child: GestureDetector(
                      onTap: () {
                        Navigation.pop();
                      },
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // down area
          Expanded(
            flex: 60,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.black,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 20,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        color: context.cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter Prompt",
                            style: context.textTheme?.titleSmall,
                          ),
                          Expanded(
                            child: TextField(
                              controller: promptController,
                              decoration: InputDecoration(
                                hintText: "Write Your Prompt Here...",
                                hintStyle: context.textTheme?.bodyMedium,

                                border: InputBorder.none,
                              ),
                              style: context.textTheme?.titleMedium,
                              expands: true,
                              scrollPhysics: ClampingScrollPhysics(),
                              maxLines: null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Expanded(
                    child: Row(
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
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
