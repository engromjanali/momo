import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/constants/colors.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/constants/dimension_theme.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
import 'package:momo/core/widgets/w_pop_button.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';
import 'package:momo/features/explore/view/s_get_started.dart';
import 'package:momo/gen/assets.gen.dart';

class SGetThisPack extends StatefulWidget {
  final EItem? eItem;
  const SGetThisPack({super.key, this.eItem});
  @override
  _SGetThisPackState createState() => _SGetThisPackState();
}

class _SGetThisPackState extends State<SGetThisPack> {
  final ScrollController _scrollController = ScrollController();
  double _opacity = 0.0;
  double _imageScale = 1.0; // Scale for bounce effect

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.offset < 0) {
          _imageScale =
              1 +
              ((_scrollController.offset).clamp(-100, 0)).abs().toDouble() /
                  1000;
        }

        // Adjust opacity based on scroll position (e.g., 0 to 1 over 400 pixels)
        _opacity = (_scrollController.offset / 290).clamp(0.0, 1.0);
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double topSectionHeight = 400;
    return Scaffold(
      body: Stack(
        children: [
          // the top image section
          Column(
            children: [
              SizedBox(
                height: topSectionHeight.h,
                child: Opacity(
                  opacity: 1.0 - _opacity,
                  child: Transform.scale(
                    scale: _imageScale,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          Assets.images.x.path, // Replace with your image path
                          fit: BoxFit.fill,
                        ),
                        Container(
                          decoration: BoxDecoration(gradient: PColors.imageFG),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Text(
                                widget.eItem?.title ?? PDefaultValues.noName,
                                style: context.textTheme?.titleLarge,
                              ),
                              Text(
                                "${widget.eItem?.images?.length} Photos",
                                style: context.textTheme?.titleLarge,
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
            ],
          ),

          // the 2nd hald screen and top widget as stack
          Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.transparent,
            // get this pack button
            bottomNavigationBar: WBottomNavButton(
              label: "Get This Pack",
              ontap: () async {
                // SUpload(eItem: widget.eItem).pushReplacement();
                SGetStarted(eItem: widget.eItem).pushReplacement();
              },
            ).pAll(),

            appBar: AppBar(
              scrolledUnderElevation: 0,
              elevation: 0,
              backgroundColor: Colors.black.withAlpha(_opacity == 1 ? 255 : 0),
              foregroundColor: Colors.white,
              leading: Center(
                child: WPButton(
                  onTap: () {
                    Navigation.pop();
                  },
                ),
              ),
              centerTitle: true,
              title: Opacity(
                opacity: _opacity,
                child: Text(
                  widget.eItem?.title ?? PDefaultValues.noName,
                  style: context.textTheme?.titleLarge,
                ),
              ),
            ),
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // to show top view.
                      gapY(topSectionHeight),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(PTheme.boarderRadius),
                            topRight: Radius.circular(PTheme.boarderRadius),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'What\'s Inside',
                                  style: context.textTheme?.titleSmall,
                                ),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: context.primaryTextColor,
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  child: Text(
                                    "SNEAK PEEK",
                                    style: context.textTheme?.titleSmall
                                        ?.copyWith(
                                          color: context.backgroundColor,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              widget.eItem?.details ?? PDefaultValues.noName,
                              style: context.textTheme?.bodySmall,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Styles & Avatars',
                              style: context.textTheme?.titleSmall,
                            ),

                            ListView.builder(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount:
                                  // widget.isExplore
                                  //     ?
                                  widget.eItem?.specifications?.length ?? 0,
                              // : widget.oneShotItem!.specifications.length,
                              itemBuilder: (_, index) {
                                return Row(
                                  spacing: 10,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: context.secondaryTextColor,
                                      size: context
                                          .textTheme
                                          ?.bodySmall
                                          ?.fontSize,
                                    ),
                                    Expanded(
                                      child: Text(
                                        widget.eItem?.specifications?[index] ??
                                            PDefaultValues.noName,
                                        style: context.textTheme?.bodySmall,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),

                            Text(
                              'Example Outputs',
                              style: context.textTheme?.titleSmall,
                            ),
                          ],
                        ).pAll(),
                      ),
                    ],
                  ),
                ),
                // sample grid view
                SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.3,
                    mainAxisSpacing: PTheme.spaceX,
                    crossAxisSpacing: PTheme.spaceX,
                  ),
                  itemCount: widget.eItem?.images?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(
                        PTheme.boarderRadius,
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.hardEdge,
                        children: [
                          Image.asset(
                            // Replace with your image path
                            Assets.images.x.path,
                            fit: BoxFit.fill,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: PColors.imageFG,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
          ),

          //
        ],
      ),
    );
  }
}
