import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/constants/dimension_theme.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/extensions/ex_padding.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/functions/f_snackbar.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/image/m_image_payload.dart';
import 'package:momo/core/widgets/image/w_image.dart';
import 'package:momo/core/widgets/w_bottom_nav_button.dart';
import 'package:momo/core/widgets/w_cancle_button.dart';
import 'package:momo/gen/assets.gen.dart';

class WPurchese extends StatefulWidget {
  const WPurchese({super.key});

  @override
  State<WPurchese> createState() => _PurcheseScreenState();
}

class _PurcheseScreenState extends State<WPurchese> {
  int selectedPlain = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [Text("Restore Purchase", style: TextStyle(fontSize: 14))],
        leading: WCancleButton(
          onTap: () {
            Navigation.pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.ratingIcon.path,
            height: 170.h,
            width: 170.w,
          ),
          Text(
            "Get Full Access.",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ).pV(value: 20),
          WProPlain(
            onTap: () {
              setState(() {
                selectedPlain = 1;
              });
            },
            title: "7-Day Full Access",
            subTitle: "Then BDT 1,400/week",
            amount: 950,
            isSelected: selectedPlain == 1,
          ).pB(value: 20),
          WProPlain(
            onTap: () {
              setState(() {
                selectedPlain = 2;
              });
            },
            title: "Yearly Access",
            amount: 5100,
            isSelected: selectedPlain == 2,
            offerText: 'SAVE 94%',
          ),

          Spacer(),
          Row(
            children: [
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _WItemTile(icon: Icons.image, label: "Ultra Realistic HD"),
                  _WItemTile(icon: Icons.lock, label: "Unlock Ai Photos"),
                  _WItemTile(
                    icon: Icons.person,
                    label: "Create One Ai Profile",
                  ),
                  _WItemTile(icon: Icons.key, label: "Access to All Style"),
                ],
              ),
              Spacer(),
            ],
          ),
          Spacer(),
          WBottomNavButton(
            label: "Purchase Now",
            ontap: () {
              showSnackBar("Thank you for having with us!");
            },
          ).pB(value: 17),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Auto-renews at Bdt 1400/week. No Commitment.\nCancel anytime.",
              style: TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ).pB(value: 20),
          ),
        ],
      ).pAll(),
    );
  }
}

class _WItemTile extends StatelessWidget {
  final IconData icon;
  final String label;
  const _WItemTile({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(width: 10),
        Text(label, style: TextStyle(color: Colors.white, fontSize: 18)),
      ],
    );
  }
}

class WProPlain extends StatelessWidget {
  final Function() onTap;
  final String title;
  final String? subTitle;
  final int amount;
  final bool isSelected;
  final String? offerText;
  const WProPlain({
    super.key,
    required this.onTap,
    required this.title,
    this.subTitle,
    required this.amount,
    required this.isSelected,
    this.offerText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: EdgeInsets.all(2.5.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(PTheme.boarderRadius),
              gradient: isSelected
                  ? LinearGradient(colors: [Colors.blue, Colors.pinkAccent])
                  : null,
              color: context.secondaryTextColor,
            ),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(210),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    isSelected ? Icons.check_circle : Icons.circle_outlined,
                    size: 25.sp,
                    color: isSelected ? Colors.white : Colors.grey,
                  ).pR(),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: context.textTheme?.titleSmall),
                        if (!isNull(subTitle))
                          Text(
                            subTitle ?? PDefaultValues.noName,
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "BDT $amount",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!isNull(offerText))
            Positioned(
              right: 30.w,
              top: -10.h,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: context.primaryTextColor,
                  borderRadius: BorderRadius.circular(PTheme.boarderRadius),
                ),
                child: Text(
                  offerText ?? PDefaultValues.noName,
                  style: context.textTheme?.titleSmall?.copyWith(
                    color: context.backgroundColor,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
