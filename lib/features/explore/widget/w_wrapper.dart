import 'package:flutter/material.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';

class WExplore extends StatelessWidget {
  final MExplore explore;
  const WExplore({super.key, required this.explore});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                explore.title ?? PDefaultValues.noName,
                style: context.textTheme?.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              onTap: () {
                // Get.to(() => SeeAllPage(explore: explore));
              },
              child: Text("See All", style: context.textTheme?.bodyLarge),
            ),
          ],
        ),

        // explore item list
        SizedBox(
          height: 210,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: explore.items?.length ?? 0,
            itemBuilder: (context, index) {
              // return getExploreItem(
              //   eItem: EItem.fromJson(explore.items?[index]),
              // );
              return Container(color: Colors.amber).pAll();
            },
          ),
        ),
      ],
    );
  }
}
