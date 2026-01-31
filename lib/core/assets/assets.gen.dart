// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/doctor_female.png
  AssetGenImage get doctorFemale =>
      const AssetGenImage('assets/images/doctor_female.png');

  /// File path: assets/images/doctor_male.png
  AssetGenImage get doctorMale =>
      const AssetGenImage('assets/images/doctor_male.png');

  /// File path: assets/images/funday.jpg
  AssetGenImage get funday => const AssetGenImage('assets/images/funday.jpg');

  /// File path: assets/images/lost_cat.png
  AssetGenImage get lostCat =>
      const AssetGenImage('assets/images/lost_cat.png');

  /// File path: assets/images/medical_lab.png
  AssetGenImage get medicalLab =>
      const AssetGenImage('assets/images/medical_lab.png');

  /// File path: assets/images/neighbors.jpg
  AssetGenImage get neighbors =>
      const AssetGenImage('assets/images/neighbors.jpg');

  /// File path: assets/images/pool.jpg
  AssetGenImage get pool => const AssetGenImage('assets/images/pool.jpg');

  /// File path: assets/images/post_dining_table.png
  AssetGenImage get postDiningTable =>
      const AssetGenImage('assets/images/post_dining_table.png');

  /// File path: assets/images/post_elevator.png
  AssetGenImage get postElevator =>
      const AssetGenImage('assets/images/post_elevator.png');

  /// File path: assets/images/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/images/profile.png');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/unit_a501.png
  AssetGenImage get unitA501 =>
      const AssetGenImage('assets/images/unit_a501.png');

  /// File path: assets/images/unit_b302.png
  AssetGenImage get unitB302 =>
      const AssetGenImage('assets/images/unit_b302.png');

  /// File path: assets/images/unit_c201.png
  AssetGenImage get unitC201 =>
      const AssetGenImage('assets/images/unit_c201.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        doctorFemale,
        doctorMale,
        funday,
        lostCat,
        medicalLab,
        neighbors,
        pool,
        postDiningTable,
        postElevator,
        profile,
        splash,
        unitA501,
        unitB302,
        unitC201
      ];
}

class $AssetsVideosGen {
  const $AssetsVideosGen();

  /// File path: assets/videos/intro.mp4
  String get intro => 'assets/videos/intro.mp4';

  /// File path: assets/videos/splash_vid.mp4
  String get splashVid => 'assets/videos/splash_vid.mp4';

  /// List of all assets
  List<String> get values => [intro, splashVid];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsVideosGen videos = $AssetsVideosGen();

  /// List of all assets
  static List<String> get values => [aEnv];
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
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
