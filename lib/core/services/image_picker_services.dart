import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:momo/core/functions/f_is_null.dart';
import 'package:momo/core/functions/f_loader.dart';
import 'package:momo/core/functions/f_snackbar.dart';
import 'package:momo/core/services/face_detection_service.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/features/explore/data/model/m_selected_image.dart';
import 'package:momo/core/widgets/w_image_source_dialog.dart';

/// remember picked image is a file so we can't treat it as asset,
/// treat as file,
/// Image.file(File(_pickedFile!.path))
class SvImagePicker {
  ImagePicker _picker = ImagePicker();

  Future<XFile?> pickSingleImage({
    ImageSource choseFrom = ImageSource.gallery,
  }) async {
    XFile? pickedFile;
    try {
      pickedFile = await _picker.pickImage(source: choseFrom);
    } catch (e) {
      showSnackBar(title: "Image Picker", "Somthing Want Wrong!");
    }
    return pickedFile;
  }

  Future<List<XFile>?> pickMultipleImage({limit = 20}) async {
    try {
      // iOS 14+ limit work
      List<XFile> pickedFileList = await _picker.pickMultiImage(limit: limit);
      return pickedFileList.take(limit).toList();
    } catch (e) {
      print("error $e");
      showSnackBar(title: "Image Picker", "Somthing Want Wrong!");
    }
  }

  Future<List<XFile>?> getLostData() async {
    try {
      if (!Platform.isAndroid)
        return null; // may we lost data only android devices.
      LostDataResponse response = await _picker.retrieveLostData();
      if (response.isEmpty) return null;
      debugPrint("lost image found");

      if (response.files != null && response.files!.isNotEmpty) {
        return response.files;
      } else {
        debugPrint("Error: ${response.exception}");
        showSnackBar(title: "Image Picker", "Picked Image Lost!");
      }
    } catch (e) {
      print(e);
      showSnackBar("Somthing Want Wrong!", title: "Image Picker");
    }
  }
}
