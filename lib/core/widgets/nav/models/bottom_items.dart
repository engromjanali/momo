import 'package:momo/features/explore/view/s_explore.dart';
import 'package:momo/features/oneshot/view/s_oneshot.dart';
import 'package:momo/features/profile/view/s_profile.dart';
import 'package:momo/gen/assets.gen.dart';
import 'm_nav_bar_item.dart';

List<MNavBarItem> homeNevItem = [
  MNavBarItem(
    title: "Explore",
    icon: Assets.icons.explore,
    unSelectedIcon: Assets.icons.explore,
    child: SExplore(),
  ),
  MNavBarItem(
    title: "OneShot",
    icon: Assets.icons.oneshot,
    unSelectedIcon: Assets.icons.oneshot,
    child: SOneshot(),
  ),
  MNavBarItem(
    title: "Profile",
    unSelectedIcon: Assets.icons.profile,
    icon: Assets.icons.profile,
    child: SProfile(),
  ),
];
