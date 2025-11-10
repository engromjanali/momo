import 'package:flutter/material.dart';
import 'package:momo/core/constants/colors.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/widgets/w_purchese.dart';
import 'package:momo/gen/assets.gen.dart';

class WProLabel extends StatelessWidget {
  const WProLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 60, height: 34),
              Text(
                "MOMO",
                style: context.textTheme?.titleMedium?.copyWith(
                  fontFamily: Assets.fonts.sFCompactRoundedMedium,
                ),
              ),

              GestureDetector(
                onTap: () {
                  WPurchese().push();
                },
                child: Container(
                  width: 60,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withAlpha(200),
                    gradient: PColors.proLinearGradient,
                  ),
                  child: Center(
                    child: Text(
                      "Pro",
                      style: context.textTheme?.titleMedium?.copyWith(
                        fontFamily: Assets.fonts.sFCompactRoundedMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
