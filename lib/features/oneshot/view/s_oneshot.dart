import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/features/explore/widget/w_section.dart';
import 'package:momo/features/explore/widget/w_top_slider.dart';
import 'package:momo/features/oneshot/controller/c_oneshot.dart';
import 'package:power_state/power_state.dart';

class SOneshot extends StatefulWidget {
  const SOneshot({super.key});

  @override
  State<SOneshot> createState() => _SOneshotState();
}

class _SOneshotState extends State<SOneshot> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    COneShot cOneShot = PowerVault.put(COneShot());
    return CustomScrollView(
      slivers: [
        // top slider
        SliverToBoxAdapter(
          child: TopSlider(
            isExplore: false,
            oneshotList: cOneShot.oneShotList,
            onTap: (oItem) {
              navigateToOSUploadScreen(oItem);
            },
          ),
        ),
        // explore section list
        SliverList.builder(
          itemCount: cOneShot.oneShotList?.length ?? 0,
          itemBuilder: (_, index) {
            return WSection(
              mOneshot: cOneShot.oneShotList![index],
              isExplore: false,
            );
          },
        ),
        SliverToBoxAdapter(child: gapY(80.h)),
      ],
    );
  }
}
