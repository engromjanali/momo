import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';
import 'package:momo/features/oneshot/view/s_photo_with_prompt.dart';

void navigateToOSUploadScreen(OItem? oitem) {
  switch (oitem?.imageBehaildText?.length) {
    case 1:
      // navigate to prompt with one image
      SPhotosWithPrompt(osItem: oitem ?? OItem()).push();
      return;
    case 2:
      // navigate to prompt with two image
      SPhotosWithPrompt(osItem: oitem ?? OItem()).push();
      return;
    default:
      return;
  }
}
