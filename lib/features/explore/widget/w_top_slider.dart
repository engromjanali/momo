import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/constants/colors.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/constants/dimension_theme.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/functions/f_printer.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/image/m_image_payload.dart';
import 'package:momo/core/widgets/image/w_image.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';
import 'package:momo/core/widgets/w_glass.dart';
import 'package:momo/features/explore/widget/w_pro_label.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';
import 'package:momo/features/profile/data/models/m_setting_item.dart';

class TopSlider extends StatefulWidget {
  final List<MExplore>? exploreList;
  final List<MOneshot>? oneshotList;
  final bool isExplore;
  final Function(dynamic) onTap;

  const TopSlider({
    super.key,
    this.exploreList,
    required this.isExplore,
    required this.onTap,
    this.oneshotList,
  });

  @override
  State<TopSlider> createState() => _TopSliderState();
}

class _TopSliderState extends State<TopSlider> with RouteAware {
  PageRoute<dynamic>? _currentRoute;
  int _currentItem = 0;
  Timer? _timer;
  PageController pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  void startTimer() {
    if (_timer?.isActive ?? false) return;
    printer("timer start");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(const Duration(seconds: 3), (_) {
        // setState(() {

        _currentItem = widget.isExplore
            ? (isNull(widget.exploreList)
                  ? 0
                  : (_currentItem + 1) %
                        widget.exploreList!.length.clamp(1, 10))
            : (isNull(widget.oneshotList)
                  ? 0
                  : (_currentItem + 1) %
                        widget.oneshotList!.length.clamp(1, 10));

        pageController.animateToPage(
          _currentItem,
          duration: Duration(milliseconds: (_currentItem == 0) ? 10 : 500),
          curve: Curves.easeIn,
        );
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Current route খুঁজুন
    final route = ModalRoute.of(context);

    // যদি route PageRoute হয় এবং আগের route এর সাথে different হয়
    if (route is PageRoute && route != _currentRoute) {
      // পুরাতন route থেকে unsubscribe
      if (_currentRoute != null) {
        NavigationService.routeObserver.unsubscribe(this);
      }

      // নতুন route তে subscribe
      _currentRoute = route;
      NavigationService.routeObserver.subscribe(this, _currentRoute!);
    }
  }

  @override
  void didPushNext() {
    _timer?.cancel();

    print('FirstScreen: নতুন screen এ গেছি');
  }

  @override
  void didPopNext() {
    startTimer();
    print('FirstScreen: ফিরে এসেছি');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    if (_currentRoute != null) {
      NavigationService.routeObserver.unsubscribe(this);
    }
    _timer?.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = Size(430.w, 450.h);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          PageView.builder(
            physics: const PageScrollPhysics(),
            controller: pageController,
            itemCount: widget.isExplore
                ? widget.exploreList?.length ?? 0
                : widget.oneshotList?.length ?? 0,

            onPageChanged: (value) {
              setState(() {
                _currentItem = value;
              });
            },
            itemBuilder: (context, index) {
              String? url = widget.isExplore
                  ? (isNotNull(widget.exploreList?[index].items) &&
                            isNotNull(
                              widget.exploreList?[index].items?.first.images,
                            )
                        ? (widget
                              .exploreList?[index]
                              .items
                              ?.first
                              .images
                              ?.first)
                        : "No explore Image")
                  : (isNotNull(widget.oneshotList?[index].items)
                        ? (widget.oneshotList?[index].items?.first.image)
                        : "No oneshot Image");
              return Column(
                children: [
                  Stack(
                    children: [
                      // image
                      Container(
                        height: size.height,
                        width: size.width,
                        decoration: BoxDecoration(),
                        child: WImage(
                          url,
                          payload: MImagePayload(
                            height: 100,
                            width: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),

                      // gradient filter
                      Container(
                        height: size.height,
                        width: size.width,
                        decoration: BoxDecoration(gradient: PColors.imageFG),
                      ),
                      WProLabel(),

                      widget.isExplore
                          ? Positioned.fill(
                              child: Column(
                                spacing: PTheme.spaceY,
                                children: [
                                  Spacer(),
                                  // Slider label
                                  AutoSizeText(
                                    "Create 60 ${widget.exploreList![_currentItem].title} version of you",
                                    textAlign: TextAlign.center,
                                    style: context.textTheme?.headlineLarge,
                                    minFontSize: 26,
                                    maxLines: 2,
                                  ),

                                  // Elevated button
                                  WGlass(
                                    border: Border.all(
                                      color: Colors.black,
                                      strokeAlign: BorderSide.strokeAlignInside,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    child: GestureDetector(
                                      onTap: () {
                                        widget.onTap(
                                          isNotNull(url)
                                              ? (widget
                                                    .exploreList?[_currentItem]
                                                    .items
                                                    ?.first)
                                              : null,
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Try ${widget.exploreList![_currentItem].title}",
                                              style:
                                                  context.textTheme?.titleSmall,
                                            ),

                                            Icon(
                                              Icons
                                                  .keyboard_arrow_right_outlined,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ).pB(value: 20),
                                ],
                              ).pAll(),
                            )
                          :
                            // for One Shot (label, button, subtitle)
                            Positioned.fill(
                              child: Column(
                                children: [
                                  Spacer(),
                                  Row(
                                    spacing: 10,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            AutoSizeText(
                                              widget
                                                      .oneshotList![_currentItem]
                                                      .title ??
                                                  PDefaultValues.noName,
                                              textAlign: TextAlign.start,
                                              style: context
                                                  .textTheme
                                                  ?.headlineMedium,
                                              minFontSize: 26,
                                              maxLines: 1,
                                            ),
                                            Text(
                                              widget
                                                      .oneshotList![_currentItem]
                                                      .title ??
                                                  PDefaultValues.noName,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                      ),
                                      WGlass(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        padding: EdgeInsets.all(
                                          PTheme.boarderRadius,
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                        child: GestureDetector(
                                          onTap: () {
                                            widget.onTap(
                                              isNotNull(url)
                                                  ? (widget
                                                        .oneshotList?[_currentItem]
                                                        .items
                                                        ?.first)
                                                  : null,
                                            );
                                          },

                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Try It",
                                                style: context
                                                    .textTheme
                                                    ?.titleLarge,
                                              ),
                                              Icon(
                                                Icons
                                                    .keyboard_arrow_right_sharp,
                                                color: Colors.white,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).pB(value: 20),
                                ],
                              ).pAll(),
                            ),
                    ],
                  ),
                ],
              );
            },
          ),

          // the linier indicator
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: _IndicatorLine(
              height: 3,
              // width: 100,
              indicatorColor: context.primaryTextColor ?? Colors.white,
              backgroundColor:
                  context.secondaryTextColor ?? Colors.grey.shade300,
              itemCount: widget.isExplore
                  ? widget.exploreList?.length.clamp(0, 10) ?? 0
                  : widget.oneshotList?.length.clamp(0, 10) ?? 0,

              selectedIndex: _currentItem,
            ),
          ),
        ],
      ),
    );
  }
}

class _IndicatorLine extends StatelessWidget {
  final int selectedIndex;
  final int itemCount;
  final Color backgroundColor;
  final Color indicatorColor;
  final double? height;
  final double? width;
  final Duration duration;
  final Curve curve;

  const _IndicatorLine({
    Key? key,
    required this.selectedIndex,
    required this.itemCount,
    this.backgroundColor = const Color(0xFF1F2937),
    this.indicatorColor = const Color(0xFF4B5563),
    this.height,
    this.width,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.linear,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final itemWidth =
        (width ?? 200.w) /
        (itemCount == 0
            ? 1
            : itemCount); // if itemcount ==0 we get an error because by 0 we can divide anything.

    return Center(
      child: Container(
        height: height ?? 5.h,
        width: width ?? 200.w,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            // Animated Sliding Indicator
            AnimatedPositioned(
              duration: duration,
              curve: curve,
              left: selectedIndex * itemWidth,
              top: 0,
              bottom: 0,
              child: Container(
                width: itemWidth,
                decoration: BoxDecoration(
                  color: indicatorColor,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
