import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momo/core/constants/dimension_theme.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/functions/f_loader.dart';
import 'package:momo/core/functions/f_printer.dart';
import 'package:momo/core/functions/f_snackbar.dart';
import 'package:momo/core/services/face_detection_service.dart';
import 'package:momo/core/services/image_picker_services.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
import 'package:momo/core/widgets/w_pop_button.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';
import 'package:momo/features/explore/data/selected_images.dart';
import 'package:momo/features/explore/data/model/m_selected_image.dart';
import 'package:momo/features/explore/view/s_gender_selection.dart';
import 'package:momo/features/explore/widget/w_upload_section_wrapper.dart';
import 'package:momo/features/explore/widget/w_selected_image.dart';
import 'package:momo/gen/assets.gen.dart';

class SUpload extends StatefulWidget {
  final EItem? eItem;
  const SUpload({super.key, this.eItem});
  @override
  _SUploadState createState() => _SUploadState();
}

class _SUploadState extends State<SUpload> {
  final ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;
  List<String> goodPhotosList = [
    Assets.images.good.a1.path,
    Assets.images.good.a2.path,
    Assets.images.good.a3.path,
    Assets.images.good.a4.path,
    Assets.images.good.a5.path,
  ];
  List<String> badPhotosList = [
    Assets.images.bad.a1.path,
    Assets.images.bad.a2.path,
    Assets.images.bad.a3.path,
    Assets.images.bad.a4.path,
    Assets.images.bad.a5.path,
    Assets.images.bad.a6.path,
    Assets.images.bad.a6.path,
    Assets.images.bad.a7.path,
    Assets.images.bad.a8.path,
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        // Adjust opacity based on scroll position (e.g., 0 to 1 over 400 pixels)
        _opacity = (_scrollController.offset / 90).clamp(0.0, 1.0);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  int goodImageCount() {
    int count = 0;
    selectedImageList.map((image) {
      if (image.isGoodImage ?? false) {
        count++;
        return image;
      }
    }).toList();
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // upload button
      bottomNavigationBar: WBottomNavButton(
        label: goodImageCount() >= 8
            ? "Continue"
            : "Upload ${isNull(selectedImageList) ? "" : "${8 - goodImageCount()} " + "More "}Photo",
        ontap: () {
          SGenderSelection().pushReplacement();
        },
        onTapIgnore: () {
          _chooseImage();
        },
        isEnabled: goodImageCount() < 8 ? false : true,
      ).pAll(),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: WPButton(
          onTap: () {
            Navigation.pop();
          },
        ),
        centerTitle: true,
        title: Opacity(
          opacity: _opacity,
          child: Text("Pick 8-12 Photos of yourself."),
        ),
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pick 8-12 Photos of yourself",
              style: context.textTheme?.titleLarge,
            ).pB(value: 40),

            // good photos
            WUSectionWrapper(
              isGood: true,
              title: "Good Photos",
              subtitle:
                  "We need to colse-up selfies of the same person, taken from a varieaty of angle and with different facial expressions and background ",
              imageList: goodPhotosList,
            ),
            // bad photos
            WUSectionWrapper(
              isGood: false,
              title: "Bad Photos",
              subtitle:
                  "We need to colse-up selfies of the same person, taken from a varieaty of angle and with different facial expressions and background ",
              imageList: badPhotosList,
            ),

            // your photos
            WUSectionWrapper(
              title: !isNull(selectedImageList) ? "Your Photos" : "",
              child: Container(
                color: context.backgroundColor,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: PTheme.spaceX,
                    crossAxisSpacing: PTheme.spaceX,
                  ),
                  itemCount: selectedImageList.isEmpty
                      ? 0
                      : (selectedImageList.length < 8 ? 8 : 12),
                  shrinkWrap: true,
                  // scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return SizedBox(
                      width: 120,
                      height: 120,
                      child: WSelectedImage(
                        onTap: () {
                          printer("hello romjan ali how are you?");
                          if (index >= selectedImageList.length ||
                              isNull(selectedImageList[index])) {
                            _chooseImage();
                          } else {
                            // remove image
                            setState(() {
                              selectedImageList.removeAt(index);
                            });
                          }
                        },
                        msImage: (index >= selectedImageList.length)
                            ? null
                            : selectedImageList[index],
                      ),
                    );
                  },
                ),
              ),
            ),
            // gap for bottom nav bar
            gapY(80),
          ],
        ).pAll(),
      ),
    );
  }

  Future<void> _chooseImage() async {
    if (selectedImageList.length >= 12) {
      showSnackBar(
        "At First Remove Bad Photos!",
        snackBarType: SnackBarType.warning,
      );
      return;
    }
    try {
      showLoader();
      // await Future.delayed(Duration(seconds: 5));
      FaceDetectionService svFaceDetector = FaceDetectionService.instance;
      List<XFile>? pickedImageList = await SvImagePicker().pickMultipleImage(
        limit: (12 - selectedImageList.length).clamp(2, 12),
      );

      if (pickedImageList != null) {
        List<MSImage> tmpList = pickedImageList
            .map((image) => MSImage(image: File(image.path).path))
            .toList();

        /// Run all async checks in serial
        for (int i = 0; i < tmpList.length; i++) {
          await Future.delayed(Duration(milliseconds: 10));
          bool isGood = await svFaceDetector.isGoodImage(
            tmpList[i].image ?? "",
          );
          tmpList[i].isGoodImage = isGood;
        }
        hideOverlay();

        /// Run all async checks in parallel
        /// but my ml kit can't work in parallely
        // await Future.wait(
        //   tmpList.map((img) async {
        //     img.isGoodImage = await svFaceDetector.isGoodImage(img.image ?? "");
        //   }),
        // );
        selectedImageList.addAll(tmpList);
        printer(selectedImageList.length);
        setState(() {});
      }
    } catch (e) {
      hideOverlay();
      printer("Error-----------$e");
    }
  }
}
