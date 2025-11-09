import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/functions/f_snackbar.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/w_pop_button.dart';
import 'package:momo/core/widgets/w_purchese.dart';
import 'package:momo/features/s_home.dart';
import 'package:momo/gen/assets.gen.dart';

class SShare extends StatefulWidget {
  const SShare({super.key});

  @override
  State<SShare> createState() => _SShareState();
}

class _SShareState extends State<SShare> {
  final List<String> filterList = [
    Assets.images.good.a1.path,
    Assets.images.good.a2.path,
    Assets.images.good.a3.path,
    Assets.images.good.a4.path,
    Assets.images.good.a5.path,
  ];

  List<String> widgetList = [
    Assets.social.save.path,
    Assets.social.ws.path,
    Assets.social.fb.path,
    Assets.social.insta.path,
    Assets.social.tktok.path,
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        leading: WPButton(
          onTap: () {
            Navigation.pop();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              SHome().pushAndRemoveUntil();
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
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 10),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox.expand(
                      child: Image.asset(
                        filterList[selectedIndex],
                        fit: BoxFit.cover,
                      ),
                    ),

                    // MomoLabel(),
                  ],
                ),
              ),
            ),

            // filter list  as list-view
            SizedBox(
              height: 120.w,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: StatefulBuilder(
                      builder: (context, setLocalState) {
                        return ListView.builder(
                          itemCount: filterList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return SizedBox(
                              width: 110.w,
                              child: _getFilterWidget(
                                ontap: () {
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                  WPurchese().push();
                                },
                                imagePath: filterList[index],
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
              height: 120.w,
              child: StatefulBuilder(
                builder: (context, setLocalState) {
                  return ListView.builder(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    itemCount: widgetList.length,
                    scrollDirection: Axis.horizontal,

                    itemBuilder: (_, index) {
                      return Center(
                        child: SizedBox(
                          width: 60.w,
                          height: 60.w,
                          child: WShareIcon(
                            path: widgetList[index],
                            size: 30,
                            onTap: () {
                              showSnackBar(
                                title: "Info",
                                "We Are Working about...\nstay with us!",
                              );
                            },
                          ).pAll(value: 5),
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
                          style: context.textTheme?.bodyMedium,
                        ),
                      ),
                    ),
                ],
              ),
            ),
      ),
    );
  }
}

class WShareIcon extends StatelessWidget {
  final String path;
  final double size;
  final Function() onTap;
  const WShareIcon({
    super.key,
    required this.path,
    required this.size,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(path, height: size),
    );
  }
}
