import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/w_app_bar.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';
import 'package:momo/features/explore/view/s_get_this_pack.dart';
import 'package:momo/features/explore/widget/w_item.dart';
import 'package:momo/features/oneshot/controller/c_oneshot.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';

class SSeeAll extends StatefulWidget {
  final MExplore? explore;
  final MOneshot? oneShot;
  final bool isExplore;
  const SSeeAll({
    super.key,
    this.explore,
    this.oneShot,
    required this.isExplore,
  });

  @override
  State<SSeeAll> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SSeeAll> {
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WAppBar(
        text: widget.isExplore
            ? widget.explore?.title ?? PDefaultValues.noName
            : widget.oneShot?.title ?? PDefaultValues.noName,
        textPositionCenter: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: widget.isExplore
                  ? widget.explore?.items?.length ?? 0
                  : widget.oneShot?.items?.length ?? 0,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.3,
              ),
              itemBuilder: (context, index) {
                return WItem(
                  onTap: () {
                    if (widget.isExplore) {
                      SGetThisPack(eItem: widget.explore?.items?[index]).push();
                    } else {
                      OItem? oitem = widget.oneShot?.items?[index];
                      navigateToOSUploadScreen(oitem);
                    }
                  },
                  size: Size(0.5.sw, 0.5.sw * 1.3),
                  oItem: widget.oneShot?.items?[index],
                  eItem: widget.explore?.items?[index],
                  isExplore: widget.isExplore,
                ).pAll(value: 5.w);
              },
            ),
          ),
        ],
      ),
    );
  }
}
