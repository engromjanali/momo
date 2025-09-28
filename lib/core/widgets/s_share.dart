import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:momo/core/asset_manager/assets/icon_manager.dart';
import 'package:momo/core/asset_manager/assets/images.dart';
import 'package:momo/core/util/constants/colors.dart';
import 'package:momo/core/util/constants/text_style.dart';
import 'package:momo/core/widgets/bottom_button.dart';
import 'package:momo/core/widgets/custom_icon.dart';
import 'package:momo/core/widgets/w_momo_label.dart';
import 'package:momo/prsentation/screens/home_page.dart';

class SShare extends StatefulWidget {
  const SShare({super.key});

  @override
  State<SShare> createState() => _SShareState();
}

class _SShareState extends State<SShare> {
  List<String> badPhotosList = [
    Images.myPhoto,
    Images.myPhoto,
    Images.myPhoto,
    Images.myPhoto,
    Images.myPhoto,
  ];

  List<Widget> widgetList = [
    FaIcon(FontAwesomeIcons.drawPolygon, color: Colors.white, size: 20),
    CustomIcon(path: IconManager.deshIcon, size: 20, color: Colors.white),
    CustomIcon(path: IconManager.afterBefore, size: 20, color: Colors.red),
  ];

  int selectedIndex = 0;

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
              Get.offAll(() => HomePage());
            },
            icon: Icon(Icons.home_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 40,right: 40, bottom: 10),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox.expand(
                      child: Image.asset(Images.myPhoto, fit: BoxFit.cover),
                    ),
                    
                    MomoLabel()
                  ],
                ),
              ),
            ),

            // filter list  as list-view
            SizedBox(
              height: 120,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: StatefulBuilder(
                      builder: (context, setLocalState) {
                        return ListView.builder(
                          itemCount: badPhotosList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return SizedBox(
                              width: 110,
                              child: _getFilterWidget(
                                ontap: () {
                                  setLocalState(() {
                                    selectedIndex = index;
                                  });
                                },
                                imagePath: badPhotosList[index],
                                isGood: false,
                                isSelected: index == selectedIndex,
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // filter list  as list-view
            SizedBox(
              height: 120,
              child: StatefulBuilder(
                builder: (context, setLocalState) {
                  return Expanded(
                    child: ListView.builder(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      itemCount: widgetList.length,
                      scrollDirection: Axis.horizontal,

                      itemBuilder: (_, index) {
                        return Center(
                          child: SizedBox(
                            width: 60,
                            height: 60,
                            child: _getShareWidget(
                              child: widgetList[index],
                              ontap: () {
                                Get.snackbar(
                                  "Info",
                                  "We Are Working about...\nstay with us!",
                                  backgroundColor: Colors.white,
                                  colorText: Colors.black,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getFilterWidget({
    required String imagePath,
    bool isGood = true,
    required Function() ontap,
    bool isSelected = false,
  }) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child:
            // show image
            Container(
              decoration: BoxDecoration(
                border: isSelected
                    ? Border.all(
                        color: Colors.white,
                        width: 2,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      )
                    : null,

                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.hardEdge,
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  if (isSelected)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Center(
                        child: Text(
                          "Romjan Ali",
                          style: getTitleStyleS().copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                ],
              ),
            ),
      ),
    );
  }

  Widget _getShareWidget({required Function() ontap, required Widget child}) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.all(1),
        child: Container(
          decoration: BoxDecoration(
            color: MyColor.cardColor,
            border: Border.all(color: MyColor.cardborderColor),
            shape: BoxShape.circle
          ),
          margin: EdgeInsets.all(2),
          child: Center(child: child),
        ),
      ),
    );
  }
}
