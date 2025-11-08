import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:momo/core/constants/default_values.dart';
import 'package:momo/core/extensions/ex_build_context.dart';
import 'package:momo/core/functions/f_snackbar.dart';
import 'package:momo/core/functions/f_url_launcher.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/gen/assets.gen.dart';

class MSItem {
  final String icon;
  final String label;
  final Function() onTap;
  final Widget? child;
  MSItem({
    this.child,
    required this.icon,
    required this.label,
    required this.onTap,
  });
}

List<MSItem> socialList = [
  MSItem(
    icon: Assets.icons.explore,
    label: "Instagram",
    onTap: () {
      OpenURLs.open(type: OpenType.url, value: PDefaultValues.instagramLink);
    },
  ),
  MSItem(icon: Assets.icons.explore, label: "Tik-Tok", onTap: () {}),
];

List<MSItem> menuList = [
  MSItem(icon: Assets.icons.explore, label: "Restore Purchase", onTap: () {}),
  MSItem(icon: Assets.icons.explore, label: "FAQ", onTap: () {}),
  MSItem(icon: Assets.icons.explore, label: "Feedback", onTap: () {}),
  MSItem(icon: Assets.icons.explore, label: "Rate Us", onTap: () {}),
  MSItem(icon: Assets.icons.explore, label: "Terms of Use", onTap: () {}),
  MSItem(icon: Assets.icons.explore, label: "Privacy Policy", onTap: () {}),
  MSItem(
    icon: Assets.icons.explore,
    label: "User ID",
    onTap: () {
      Clipboard.setData(ClipboardData(text: "483nvidfn10238593"));
      showSnackBar("Copyed!");
    },
    child: Row(
      children: [
        Expanded(
          child: Text(
            "483nvidfn10238593",
            style: NavigationService.currentContext.textTheme?.bodySmall,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Icon(Icons.file_copy),
      ],
    ),
  ),
];
