// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/SF-Compact-Rounded-Medium.ttf
  String get sFCompactRoundedMedium =>
      'assets/fonts/SF-Compact-Rounded-Medium.ttf';

  /// File path: assets/fonts/SF-Compact-Rounded-Regular.ttf
  String get sFCompactRoundedRegular =>
      'assets/fonts/SF-Compact-Rounded-Regular.ttf';

  /// File path: assets/fonts/SF-Compact-Rounded-Ultralight.ttf
  String get sFCompactRoundedUltralight =>
      'assets/fonts/SF-Compact-Rounded-Ultralight.ttf';

  /// List of all assets
  List<String> get values => [
    sFCompactRoundedMedium,
    sFCompactRoundedRegular,
    sFCompactRoundedUltralight,
  ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Explore.svg
  String get explore => 'assets/icons/Explore.svg';

  /// File path: assets/icons/after_before.svg
  String get afterBefore => 'assets/icons/after_before.svg';

  /// File path: assets/icons/dashicons_admin-customizer.png
  AssetGenImage get dashiconsAdminCustomizer =>
      const AssetGenImage('assets/icons/dashicons_admin-customizer.png');

  /// File path: assets/icons/oneshot.svg
  String get oneshot => 'assets/icons/oneshot.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// List of all assets
  List<dynamic> get values => [
    explore,
    afterBefore,
    dashiconsAdminCustomizer,
    oneshot,
    profile,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/x.jpg
  AssetGenImage get x => const AssetGenImage('assets/images/x.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [logo, x];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/404_error.svg
  String get a404Error => 'assets/logo/404_error.svg';

  /// File path: assets/logo/Image.svg
  String get image => 'assets/logo/Image.svg';

  /// File path: assets/logo/addbutton.svg
  String get addbutton => 'assets/logo/addbutton.svg';

  /// File path: assets/logo/apple.svg
  String get apple => 'assets/logo/apple.svg';

  /// File path: assets/logo/community.svg
  String get community => 'assets/logo/community.svg';

  /// File path: assets/logo/edit.svg
  String get edit => 'assets/logo/edit.svg';

  /// File path: assets/logo/edit_profile.svg
  String get editProfile => 'assets/logo/edit_profile.svg';

  /// File path: assets/logo/empty_data.svg
  String get emptyData => 'assets/logo/empty_data.svg';

  /// File path: assets/logo/google.svg
  String get google => 'assets/logo/google.svg';

  /// File path: assets/logo/imageNotFound.svg
  String get imageNotFound => 'assets/logo/imageNotFound.svg';

  /// File path: assets/logo/logout.svg
  String get logout => 'assets/logo/logout.svg';

  /// File path: assets/logo/menu.svg
  String get menu => 'assets/logo/menu.svg';

  /// File path: assets/logo/my_apps.svg
  String get myApps => 'assets/logo/my_apps.svg';

  /// File path: assets/logo/notification.svg
  String get notification => 'assets/logo/notification.svg';

  /// File path: assets/logo/openApp.svg
  String get openApp => 'assets/logo/openApp.svg';

  /// File path: assets/logo/person.svg
  String get person => 'assets/logo/person.svg';

  /// File path: assets/logo/power_off.svg
  String get powerOff => 'assets/logo/power_off.svg';

  /// File path: assets/logo/profile.svg
  String get profile => 'assets/logo/profile.svg';

  /// File path: assets/logo/search.svg
  String get search => 'assets/logo/search.svg';

  /// File path: assets/logo/settings.svg
  String get settings => 'assets/logo/settings.svg';

  /// File path: assets/logo/splash_logo.png
  AssetGenImage get splashLogo =>
      const AssetGenImage('assets/logo/splash_logo.png');

  /// File path: assets/logo/unavailable.svg
  String get unavailable => 'assets/logo/unavailable.svg';

  /// File path: assets/logo/upload_app.svg
  String get uploadApp => 'assets/logo/upload_app.svg';

  /// File path: assets/logo/x.svg
  String get x => 'assets/logo/x.svg';

  /// List of all assets
  List<dynamic> get values => [
    a404Error,
    image,
    addbutton,
    apple,
    community,
    edit,
    editProfile,
    emptyData,
    google,
    imageNotFound,
    logout,
    menu,
    myApps,
    notification,
    openApp,
    person,
    powerOff,
    profile,
    search,
    settings,
    splashLogo,
    unavailable,
    uploadApp,
    x,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
