import 'package:flutter/material.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/features/explore/controller/c_explore.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';
import 'package:momo/features/explore/widget/w_explore_list.dart';
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
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CExplore cExplore = PowerVault.put(CExplore());
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: TopSlider(
            isExplore: true,
            exploreList: cExplore.exploreList,
            onTap: (itemIndex) {},
          ),
        ),

        SliverList.builder(
          itemCount: cExplore.exploreList?.length ?? 0,
          itemBuilder: (_, index) {
            return WExploreList(mExplore: cExplore.exploreList![index]);
          },
        ),
      ],
    );
  }
}
