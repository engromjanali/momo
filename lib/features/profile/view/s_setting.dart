import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/functions/f_snackbar.dart';
import 'package:momo/core/widgets/w_card.dart';
import 'package:momo/features/profile/data/models/m_setting_item.dart';
import 'package:momo/gen/assets.gen.dart';

class SSetting extends StatefulWidget {
  const SSetting({super.key});

  @override
  State<SSetting> createState() => _SSettingState();
}

class _SSettingState extends State<SSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: Text("Settings"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox.shrink().pDivider(),
            gapY(50),

            Column(
              children: [
                WCard(
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: socialList.length,
                    itemBuilder: (_, index) {
                      return _WSItem(
                        label: socialList[index].label,
                        iconData: socialList[index].icon,
                        onTap: socialList[index].onTap,
                        isLastitem: socialList.length - 1 == index,
                        child: socialList[index].child,
                      );
                    },
                  ),
                ).pB(value: 20),
                WCard(
                  child: ListView.builder(
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: menuList.length,
                    itemBuilder: (_, index) {
                      return _WSItem(
                        label: menuList[index].label,
                        iconData: menuList[index].icon,
                        onTap: menuList[index].onTap,
                        // isLastitem: menuList.length - 1 == index,
                        child: menuList[index].child,
                      );
                    },
                  ),
                ),
              ],
            ).pAll(),

            Text("Version 2.6.1", style: context.textTheme?.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _WSItem extends StatelessWidget {
  final String label;
  final String iconData;
  final Function() onTap;
  final bool isLastitem;
  final Widget? child;
  const _WSItem({
    super.key,
    required this.label,
    required this.iconData,
    required this.onTap,
    this.isLastitem = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isPng = iconData.endsWith(".png");
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              isPng
                  ? Image.asset(iconData, height: 20.w, width: 20.w)
                  : SvgPicture.asset(
                      iconData,
                      colorFilter: ColorFilter.mode(
                        context.primaryTextColor ?? Colors.grey,
                        BlendMode.srcIn,
                      ),
                      errorBuilder: (context, error, stackTrace) =>
                          Image.asset(Assets.images.x.path),
                      height: 20.w,
                    ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    label, // the text
                    style: context.textTheme?.titleSmall,
                  ),
                ),
              ),
              !isNull(child)
                  ? SizedBox(width: 100.w, child: child!)
                  : Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                      size: 25.w,
                    ),
            ],
          ).pAll(),
        ),
        if (!isLastitem) SizedBox().pDivider(),
      ],
    );
  }
}
