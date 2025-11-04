import 'package:momo/core/controllers/c_base.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';

class CExplore extends CBase {
  List<MExplore>? _itemList = [
    MExplore(
      title: "linkedin",
      items: [
        EItem(images: ["as", "as", "as"], title: "as", details: "sdfa"),
      ],
    ),
    MExplore(
      title: "linkedin",
      items: [
        EItem(images: ["as", "as", "as"], title: "as", details: "sdfa"),
      ],
    ),
  ];
  List<MExplore>? get exploreList => _itemList;
}
