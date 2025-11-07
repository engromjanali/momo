import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momo/core/constants/colors.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/services/image_picker_services.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/image/w_image.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
import 'package:momo/features/explore/view/upload/data/data_source/selected_images.dart';
import 'package:momo/features/explore/view/upload/data/model/m_selected_image.dart';
import 'package:momo/features/explore/view/upload/widget/w_selected_image.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';
import 'package:momo/features/oneshot/widgets/w_dialog.dart';

class SPhotosWithOutPrompt extends StatefulWidget {
  final OItem oItem;
  const SPhotosWithOutPrompt({super.key, required this.oItem});

  @override
  State<SPhotosWithOutPrompt> createState() => _PhotosWithOutPromptState();
}

class _PhotosWithOutPromptState extends State<SPhotosWithOutPrompt> {
  List<File?> pickedImageList = [];

  @override
  void initState() {
    widget.oItem.imageBehaildText?.map((x) {
      pickedImageList.add(null);
    }).toList();
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
            flex: 60,
            child: Stack(
              children: [
                // image
                SizedBox.expand(child: WImage(widget.oItem.image)),
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
                          widget.oItem.title ?? PDefaultValues.noName,
                          style: context.textTheme?.titleLarge,
                        ),
                        Text(
                          widget.oItem.subTitle ?? PDefaultValues.noName,
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
            flex: 40,
            child: Container(
              padding: EdgeInsets.all(10),
              color: Colors.black,
              child: Row(
                children: List.generate(
                  widget.oItem.imageBehaildText?.length ?? 0,
                  (index) {
                    return Expanded(
                      child: WSelectedImage(
                        label: widget.oItem.imageBehaildText?[0],
                        onTap: () async {
                          if (!isNull(selectedImageList[index])) {
                            // remove image
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
                                  pickedImageList[index] = File(
                                    pickedImageFile?.path ?? "No Path",
                                  );
                                });
                              }
                            }
                          }
                        },

                        msImage: MSImage(
                          image: pickedImageList[index]?.path ?? "No Path",
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          gapY(100),
        ],
      ),
    );
  }
}
