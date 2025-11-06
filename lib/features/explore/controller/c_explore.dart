import 'package:momo/core/controllers/c_base.dart';
import 'package:momo/features/explore/data/model/m_explore.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';

class CExplore extends CBase {
  List<MExplore>? _itemList = [
    MExplore(
      title: "linkedin",
      items: [
        EItem(images: ["as", "as", "as"], title: "a", details: "sdfa"),
      ],
    ),
    MExplore(
      title: "linkedin2",
      items: [
        EItem(
          images: ["as", "as", "as"],
          title: "b",
          details: "sdfa",
          spacificaton: ["12", "213123", "@3123"],
        ),
      ],
    ),
  ];
  List<MExplore>? get exploreList => _itemList;
}
