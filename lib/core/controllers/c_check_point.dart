import 'package:get/get.dart';
import 'package:momo/core/controllers/c_theme.dart';
import 'package:flutter/material.dart';
import 'package:momo/core/functions/f_call_back.dart';
import 'package:momo/profile/controllers/c_profile.dart';
import 'package:momo/profile/data/data_source/profile_data_source_impl.dart';
import 'package:momo/profile/data/repository/patient_repository_impl.dart';
import '/./core/services/navigation_service.dart';
import '../constants/keys.dart';
import '../functions/f_is_null.dart';
import '../services/shared_preference_service.dart';

/// 🔁 A checkpoint to handle initialization and navigation after a short delay.
class CCheckPoint {
  Future<void> initialization() async {
    callBackFunction(() async {
      await Future.delayed(const Duration(milliseconds: 500));
      final context = NavigationService.currentContext;
      if (!context.mounted) return;
      final Brightness brightness = MediaQuery.of(context).platformBrightness;
      final bool isDarkMode = brightness == Brightness.dark;
      int? themeIndex = await SharedPrefService.instance.getInt(
        PKeys.themeIndex,
      );
      final CTheme cTheme = Get.find<CTheme>();
      cTheme.updateTheme(index: themeIndex ?? (isDarkMode ? 1 : 0));
      final CProfile cProfile = Get.put(
        CProfile(ProfileRepositoryImpl(ProfileDataSourceImpl())),
      );
      String? token = await SharedPrefService.instance.getString(
        PKeys.usertoken,
      );
      if (!isNull(token)) {
        await cProfile.getPatientList();
      }
      // await const SRoot().pushAndRemoveUntil();
    });
  }
}
