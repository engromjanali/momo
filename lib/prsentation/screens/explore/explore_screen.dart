import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:momo/core/asset_manager/assets/images.dart';
import 'package:momo/core/widgets/get_this_pack.dart';
import 'package:momo/data/model/explore/explore_item_model.dart';
import 'package:momo/data/model/explore/explore_model.dart';
import 'package:momo/prsentation/screens/explore/controllers/explore_controller.dart';
import 'package:momo/prsentation/screens/explore/widgets/current_item_indicator.dart';
import 'package:momo/prsentation/screens/explore/widgets/top_slider.dart';
import 'package:momo/core/widgets/model_name_screen.dart';
import 'package:momo/prsentation/screens/photos_without_prompt.dart';
import 'package:momo/prsentation/screens/photos_with_prompt.dart';
import 'package:momo/core/widgets/see_all_page.dart';
import 'package:momo/prsentation/screens/explore/widgets/explore_list.dart';
import 'package:momo/core/widgets/pro_label.dart';
import 'package:momo/test.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      CExplore cExplore = context.read<CExplore>();
      cExplore.setExploreList([]);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    CExplore cExplore = context.watch<CExplore>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TopSlider(
                  exploreList: cExplore.exploreList,
                  isExplore: true,
                  onTap: (explore) {
                    // we have to navigate to this page with the hole explore and show sorted few image and offer the whole explore pack
                    // but for this moment we are nagvigating with a item.
                    Get.to(()=>GetThisPack(
                      eItem: EItemModel.fromMap(explore.items[0]),
                    ));
                  },
                ),
            
            
                // explore list 
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cExplore.exploreList.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return getExploreList(
                      context,
                      explore: cExplore.exploreList[index],
                    );
                  },
                ),
              ],
            ),
          ),

          // the top label of pro
          proLabel(),
        ],
      ),
    );
  }
}
