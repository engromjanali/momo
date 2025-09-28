import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:momo/core/asset_manager/assets/images.dart';
import 'package:momo/core/util/constants/text_style.dart';
import 'package:momo/core/widgets/glass_widget.dart';
import 'package:momo/data/model/explore/explore_model.dart';
import 'package:momo/data/model/one_shot/oneshot_item_model.dart';
import 'package:momo/data/model/one_shot/oneshot_model.dart';
import 'package:momo/prsentation/screens/explore/widgets/current_item_indicator.dart';
import 'package:momo/test.dart';
import 'dart:async';

import 'package:flutter/material.dart';

class TopSlider extends StatefulWidget {
  final List<ExploreModel>? exploreList;
  final List<OSItemModel>? oneShotItemList;
  final bool isExplore;
  final Function(dynamic) onTap;

  const TopSlider({
    super.key,
    this.exploreList,
    required this.isExplore,
    required this.onTap,
    this.oneShotItemList,
  });

  @override
  State<TopSlider> createState() => _TopSliderState();
}

class _TopSliderState extends State<TopSlider> {
  int _currentItem = 0;
  Timer? _timer;
  PageController pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(const Duration(seconds: 3), (_) {
        // setState(() {

        _currentItem = widget.isExplore
            ? (widget.exploreList!.isEmpty
                  ? 0
                  : (_currentItem + 1) %
                        widget.exploreList!.length.clamp(1, 10))
            : (widget.oneShotItemList!.isEmpty
                  ? 0
                  : (_currentItem + 1) %
                        widget.oneShotItemList!.length.clamp(1, 10));
        // });

        pageController.animateToPage(
          _currentItem,
          duration: Duration(milliseconds: (_currentItem == 0) ? 10 : 500),
          curve: Curves.easeIn,
        );
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height / 2,
      child: StatefulBuilder(
        builder: (_, setLocalState) {
          return Stack(
            children: [
              PageView.builder(
                physics: const PageScrollPhysics(),
                controller: pageController,
                itemCount: widget.isExplore
                    ? widget.exploreList!.length
                    : widget.oneShotItemList!.length,

                onPageChanged: (value) {
                  setLocalState(() {
                    _currentItem = value;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          // image
                          Container(
                            height: size.height / 2,
                            width: double.infinity,
                            decoration: BoxDecoration(),
                            child: Image.asset(
                              errorBuilder: (context, error, stackTrace) =>
                                  SizedBox.shrink(),
                              Images.myPhoto,
                              fit: BoxFit.fill,
                            ),
                          ),

                          // gradient filter
                          Container(
                            height: size.height / 2,
                            width: size.width,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin:
                                    Alignment.bottomCenter, // start at bottom
                                end: Alignment.topCenter,
                                // transform: GradientRotation(4),
                                colors: [
                                  Colors.black, // bottom color
                                  Colors.transparent, // top color
                                  Colors.transparent, // top color
                                ],
                              ),
                            ),
                          ),

                          widget.isExplore
                              ? Positioned.fill(
                                  child: Column(
                                    children: [
                                      Spacer(),

                                      // Slider label
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: AutoSizeText(
                                          "Create 60 ${widget.exploreList![_currentItem].title} version of you",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 30,
                                            color: Colors.white,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          minFontSize: 26,
                                          maxLines: 2,
                                        ),
                                      ),

                                      // Elevated button
                                      glassWidget(
                                        borderRadius: BorderRadius.circular(20),
                                        child: GestureDetector(
                                          onTap: () {
                                            widget.onTap(widget.exploreList![_currentItem]);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                              "Try ${widget.exploreList![_currentItem].title}",
                                              style: getTitleStyleS(),
                                            ),
                                            
                                            Icon(
                                              Icons.keyboard_arrow_right_outlined,
                                              color: Colors.white,
                                            ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 40),
                                    ],
                                  ),
                                )
                              :
                                // for One Shot (label, button, subtitle)
                                Positioned.fill(
                                  child: Column(
                                    children: [
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                        ),
                                        child: Row(
                                          spacing: 10,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  AutoSizeText(
                                                    widget
                                                        .oneShotItemList![_currentItem]
                                                        .title,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: 30,
                                                      color: Colors.white,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    minFontSize: 26,
                                                    maxLines: 1,
                                                  ),
                                                  Text(
                                                    widget.oneShotItemList![_currentItem].subTitle,
                                                    textAlign: TextAlign.start,
                                                    style: getSubtitleStyleL(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            glassWidget(
                                              padding: EdgeInsets.all(8),
                                              borderRadius: BorderRadius.circular(20),
                                              child: GestureDetector(
                                                onTap: () {
                                                  widget.onTap(widget.oneShotItemList![_currentItem]);
                                                },
                                                  
                                                child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                   Text(
                                                    "Try It",
                                                    style: getTitleStyleS()
                                                  ),
                                                  Icon(Icons.keyboard_arrow_right_sharp, color: Colors.white,)
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 40),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              // the linier indicator
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: currentItemIndicator(
                  widget.isExplore
                      ? widget.exploreList!.length.clamp(0, 10)
                      : widget.oneShotItemList!.length.clamp(
                          0,
                          10,
                        ), // maximun 10, minimum how have
                  _currentItem,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
