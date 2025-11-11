import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/features/explore/controller/c_explore.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';
import 'package:momo/features/explore/view/s_get_this_pack.dart';
import 'package:momo/features/explore/widget/w_section.dart';
import 'package:momo/features/explore/widget/w_top_slider.dart';
import 'package:power_state/power_state.dart';

class SExplore extends StatefulWidget {
  const SExplore({super.key});

  @override
  State<SExplore> createState() => _SExploreState();
}

class _SExploreState extends State<SExplore> {
  final PageController _pageController = PageController();

  @override
  void initState() {
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
    CExplore cExplore = PowerVault.put(CExplore());
    print(cExplore.exploreList?[0].toJson());
    return CustomScrollView(
      slivers: [
        // top slider
        SliverToBoxAdapter(
          child: TopSlider(
            isExplore: true,
            exploreList: cExplore.exploreList,
            onTap: (eItem) {
              SGetThisPack(eItem: eItem).push();
            },
          ),
        ),
        // explore section list
        SliverList.builder(
          itemCount: cExplore.exploreList?.length ?? 0,
          itemBuilder: (_, index) {
            return WSection(
              mExplore: cExplore.exploreList![index],
              isExplore: true,
            );
          },
        ),
        SliverToBoxAdapter(child: gapY(80.h)),
      ],
    );
  }
}
