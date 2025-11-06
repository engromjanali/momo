import 'package:flutter/material.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
import 'package:momo/gen/assets.gen.dart';

class SSave extends StatefulWidget {
  const SSave({super.key});

  @override
  State<SSave> createState() => _SSaveState();
}

class _SSaveState extends State<SSave> {
  List<String> badPhotosList = [
    Assets.images.x.path,
    Assets.images.x.path,
    Assets.images.x.path,
    Assets.images.x.path,
    Assets.images.x.path,
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.photo))],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox.expand(
                      child: Image.asset(
                        Assets.images.x.path,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: -20,
                      bottom: 40,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: context.cardColor,
                              shape: BoxShape.circle,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 1,
                                horizontal: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                              ),
                              child: Text(
                                "HD",
                                style: context.textTheme?.titleMedium?.copyWith(
                                  color: Colors.indigoAccent,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: context.cardColor,
                              shape: BoxShape.circle,
                            ),
                            // child: CustomIcon(
                            //   path: IconManager.afterBefore,
                            //   color: MyColor.white,
                            // ),
                          ),
                        ],
                      ),
                    ),

                    // MomoLabel(),
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
                  SizedBox(
                    height: 110,
                    width: 110,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: context.cardColor,
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              // child: CustomIcon(
                              //   path: IconManager.deshIcon,
                              //   color: MyColor.white,
                              // ),
                            ),

                            Text("Custom", style: context.textTheme?.bodyLarge),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Container(height: 50, width: 1, color: Colors.white),
                  ),
                  Expanded(
                    child: StatefulBuilder(
                      builder: (context, setLocalState) {
                        return ListView.builder(
                          itemCount: badPhotosList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return SizedBox(
                              width: 110,
                              child: _getImageWidget(
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

            // bottom section
            Row(
              children: [
                Column(
                  children: [
                    Icon(Icons.update, color: Colors.white),
                    Text("Rest All", style: TextStyle(color: Colors.white)),
                  ],
                ),
                Expanded(
                  child: WBottomNavButton(
                    label: "Save",
                    ontap: () {
                      // Get.to(() => SShare());
                    },
                  ).pAll(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _getImageWidget({
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
            Column(
              children: [
                if (!isSelected) SizedBox(height: 10),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
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
                            child: IconButton(
                              onPressed: ontap,
                              icon: Icon(
                                isGood ? Icons.check_circle : Icons.cancel,
                                color: isGood ? Colors.green : Colors.red,
                                size: 20,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                if (isSelected)
                  Icon(Icons.circle, color: Colors.white, size: 10),
              ],
            ),
      ),
    );
  }
}
