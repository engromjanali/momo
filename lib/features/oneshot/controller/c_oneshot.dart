import 'package:momo/core/controllers/c_base.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';
import 'package:momo/features/oneshot/view/s_photo_with_prompt.dart';
import 'package:momo/features/oneshot/view/s_photo_without_prompt.dart';

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
        OItem(
          title: "item 3",
          subTitle: "sub-item-2",
          image: "mo image",
          imageBehaildText: ["select your husbend image-2"],
        ),
        OItem(
          title: "item 3",
          subTitle: "sub-item-2",
          image: "mo image",
          imageBehaildText: [
            "select your husbend image-2",
            "select your husbend image-2",
          ],
        ),
      ],
    ),
  ];
  List<MOneshot>? get oneShotList => _oneShotList;
}


void navigateToOSUploadScreen(OItem? oitem) {
  if (isNull(oitem?.prompt)) {
    SPhotosWithOutPrompt(oItem: oitem ?? OItem()).push();
  } else {
    SPhotosWithPrompt(osItem: oitem ?? OItem()).push();
  }
}
