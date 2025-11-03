import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:momo/core/controllers/c_theme.dart';
import 'package:momo/core/functions/f_default_scrolling.dart';
import 'package:momo/core/functions/f_firebase_analytics.dart';
import 'package:momo/core/services/navigation_service.dart';
import 'package:momo/core/services/shared_preference_service.dart';
import 'package:momo/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //   await CNotification().requestPermission();
  //   FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  //   await CNotification().initNotification();
  // init base method otherwise we may get an error like "xyz was not initialized".
  await SharedPrefService.instance.init();

  runApp(const _SCheckPoint());
}

class _SCheckPoint extends StatefulWidget {
  const _SCheckPoint();

  @override
  State<_SCheckPoint> createState() => __SCheckPointState();
}

class __SCheckPointState extends State<_SCheckPoint> {
  final CTheme themeController = Get.put(CTheme());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CTheme>(
      builder: (controller) {
        return ScreenUtilInit(
          designSize: kIsWeb ? Size(430, 932) : Size(430, 932),
          minTextAdapt: true,
          splitScreenMode: true,
          fontSizeResolver: (fontSize, screenUtil) {
            if (kIsWeb) {
              // On web: ignore scaling, just use original fontSize
              return fontSize.toDouble();
            } else {
              // On mobile: use normal scaled fontSize
              return fontSize * // orginial font size.
                  screenUtil.scaleWidth * // screen wise scale factor
                  screenUtil.textScaleFactor; // user devices text scale factor
            }
          },
          builder: (ctx, _) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              navigatorKey: NavigationService.key,
              theme: controller.currentTheme,
              darkTheme: controller.currentTheme,
              builder: (contxt, child) {
                return AnnotatedRegion<SystemUiOverlayStyle>(
                  value: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness:
                        contxt.theme.brightness == Brightness.dark
                        ? Brightness.light
                        : Brightness.dark,
                  ),
                  child: ScrollConfiguration(
                    behavior: PScrollBehavior(),
                    child: kIsWeb
                        ? Center(
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                maxWidth: 480,
                              ), // ✅ adjust width here
                              child: child!,
                            ),
                          )
                        : child!,
                  ),
                );
              },
              home: Container(
                color: Colors.red,
                child: ElevatedButton(
                  onPressed: () {
                    AnalyticsService().logCustomEvent("User Event", {
                      "para": "pra",
                    });
                  },
                  child: Text("data"),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
