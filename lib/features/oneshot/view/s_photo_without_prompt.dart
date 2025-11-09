import 'package:flutter/material.dart';
import 'package:momo/core/constants/colors.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/constants/dimension_theme.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/functions/f_pick_single_image.dart';
import 'package:momo/core/functions/f_printer.dart';
import 'package:momo/core/functions/f_snackbar.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/image/m_image_payload.dart';
import 'package:momo/core/widgets/image/w_image.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
import 'package:momo/core/widgets/w_pop_button.dart';
import 'package:momo/core/widgets/w_purchese.dart';
import 'package:momo/features/explore/data/selected_images.dart';
import 'package:momo/features/explore/data/model/m_selected_image.dart';
import 'package:momo/features/explore/widget/w_selected_image.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';

class SPhotosWithOutPrompt extends StatefulWidget {
  final OItem oItem;
  const SPhotosWithOutPrompt({super.key, required this.oItem});

  @override
  State<SPhotosWithOutPrompt> createState() => _PhotosWithOutPromptState();
}

class _PhotosWithOutPromptState extends State<SPhotosWithOutPrompt> {
  @override
  void initState() {
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
        isEnabled:
            selectedImageList.isNotEmpty &&
            selectedImageList.any((e) => e.isGoodImage ?? false),
      ).pAll(),
      body: Column(
        children: [
          // top area
          Expanded(
            flex: 60,
            child: Stack(
              children: [
                // image
                SizedBox.expand(
                  child: WImage(
                    widget.oItem.image,
                    payload: MImagePayload(fit: BoxFit.cover),
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
            flex: 40,
            child: Row(
              spacing: PTheme.spaceX,
              children: List.generate(
                widget.oItem.imageBehaildText?.length ?? 0,
                (index) {
                  return Expanded(
                    child: WSelectedImage(
                      label: widget.oItem.imageBehaildText?[index],
                      onTap: () async {
                        if (index < selectedImageList.length) {
                          selectedImageList.removeAt(index);
                          setState(() {});
                        } else {
                          try {
                            MSImage? msImage = await pickSingleImage();
                            if (!isNull(msImage)) {
                              setState(() {
                                selectedImageList.add(msImage!);
                              });
                            }
                          } catch (e) {
                            showSnackBar("Sonthing Want Wrong!");
                            errorPrint(e);
                          }
                        }
                      },

                      msImage: index >= selectedImageList.length
                          ? null
                          : selectedImageList[index],
                    ),
                  );
                },
              ),
            ).pAll(),
          ),

          gapY(80),
        ],
      ),
    );
  }
}
