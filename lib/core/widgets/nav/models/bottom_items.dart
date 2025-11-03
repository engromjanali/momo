import 'package:flutter/widgets.dart';
import 'package:momo/gen/assets.gen.dart';
import '/../core/widgets/nav/models/nav_bar_model.dart';

List<NavigationBarItem> rootBodyitems = [
  NavigationBarItem(
    title: "Home",
    icon: Assets.logo.community,
    unSelectedIcon: Assets.logo.community,
    // child: SHome(),
  ),
  NavigationBarItem(
    title: "My Apps",
    icon: Assets.logo.community,
    unSelectedIcon: Assets.logo.community,
    // child: WMyApps(physics: const NeverScrollableScrollPhysics()),
  ),
  NavigationBarItem(
    title: "Add App",
    unSelectedIcon: Assets.logo.addbutton,
    icon: Assets.logo.addbutton,
    // child: SSubmitAppDetails(),
  ),
  NavigationBarItem(
    title: "Cart",
    icon: Assets.logo.community,
    unSelectedIcon: Assets.logo.community,
    child: SizedBox(),
  ),
  NavigationBarItem(
    title: "Profile",
    unSelectedIcon: Assets.logo.community,
    icon: Assets.logo.community,
    // child: const SProfile(),
  ),
];
