import 'package:flutter/material.dart';
import 'package:momo/core/controllers/c_base.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';

class COneShot extends CBase {
  final List<MOneshot>? _oneShotList = [
    MOneshot(
      title: "linkedin",
      items: [
        OItem(
          title: "item 1",
          subTitle: "sub-item-1",
          image: "no image",
          prompt: "make the weather sunny.",
          imageBehaildText: ["select your image", "select your husbend image"],
        ),
        OItem(
          title: "item 2",
          subTitle: "sub-item-2",
          prompt: "make the weather sunny-2.",
          image: "mo image",
          imageBehaildText: ["select your husbend image-2"],
        ),
      ],
    ),
  ];
  List<MOneshot>? get oneShotList => _oneShotList;
}
