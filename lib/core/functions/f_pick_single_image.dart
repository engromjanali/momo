import 'package:image_picker/image_picker.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/functions/f_loader.dart';
import 'package:momo/core/functions/f_printer.dart';
import 'package:momo/core/functions/f_snackbar.dart';
import 'package:momo/core/services/face_detection_service.dart';
import 'package:momo/core/services/image_picker_services.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/features/explore/data/model/m_selected_image.dart';
import 'package:momo/core/widgets/w_image_source_dialog.dart';

Future<MSImage?> pickSingleImage({bool showOption = true}) async {
  try {
    printer("**************");
    showLoader();
    ImageSource? src;
    if (showOption) {
      src = await WISSDialog(NavigationService.currentContext);
      if (isNull(src)) {
        hideOverlay();
        return null;
      }
    }

    XFile? tmp = await SvImagePicker().pickSingleImage(
      choseFrom: src ?? ImageSource.gallery,
    );
    if (!isNull(tmp)) {
      bool isgood = await FaceDetectionService.instance.isGoodImage(
        tmp?.path ?? "No Image",
      );
      hideOverlay();
      return MSImage(image: tmp?.path, isGoodImage: isgood);
    }
    hideOverlay();
  } catch (e) {
    hideOverlay();
    showSnackBar("Somthing Want Wrong!");
    errorPrint(e);
  }
}
