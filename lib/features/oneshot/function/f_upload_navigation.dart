import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/features/oneshot/data/model/m_oneshot.dart';
import 'package:momo/features/oneshot/view/s_photo_with_prompt.dart';
import 'package:momo/features/oneshot/view/s_photo_without_prompt.dart';

void navigateToOSUploadScreen(OItem? oitem) {
  if (isNull(oitem?.prompt)) {
    SPhotosWithOutPrompt(oItem: oitem ?? OItem()).push();
  } else {
    SPhotosWithPrompt(osItem: oitem ?? OItem()).push();
  }
}
