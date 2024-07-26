/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/cart.png
  AssetGenImage get cart => const AssetGenImage('assets/icons/cart.png');

  /// List of all assets
  List<AssetGenImage> get values => [cart];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Accessories.png
  AssetGenImage get accessories =>
      const AssetGenImage('assets/images/Accessories.png');

  /// File path: assets/images/Bag.png
  AssetGenImage get bag => const AssetGenImage('assets/images/Bag.png');

  /// File path: assets/images/Hoodies.png
  AssetGenImage get hoodies => const AssetGenImage('assets/images/Hoodies.png');

  /// File path: assets/images/Long Sleeve Flannel Shirt.png
  AssetGenImage get longSleeveFlannelShirt =>
      const AssetGenImage('assets/images/Long Sleeve Flannel Shirt.png');

  /// File path: assets/images/Long Sleeve Square Flannel Shirt.png
  AssetGenImage get longSleeveSquareFlannelShirt =>
      const AssetGenImage('assets/images/Long Sleeve Square Flannel Shirt.png');

  /// File path: assets/images/Shoes.png
  AssetGenImage get shoes => const AssetGenImage('assets/images/Shoes.png');

  /// File path: assets/images/Shorts.png
  AssetGenImage get shorts => const AssetGenImage('assets/images/Shorts.png');

  /// File path: assets/images/logo_google.png
  AssetGenImage get logoGoogle =>
      const AssetGenImage('assets/images/logo_google.png');

  /// File path: assets/images/logo_red.png
  AssetGenImage get logoRed =>
      const AssetGenImage('assets/images/logo_red.png');

  /// File path: assets/images/logo_white.png
  AssetGenImage get logoWhite =>
      const AssetGenImage('assets/images/logo_white.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        accessories,
        bag,
        hoodies,
        longSleeveFlannelShirt,
        longSleeveSquareFlannelShirt,
        shoes,
        shorts,
        logoGoogle,
        logoRed,
        logoWhite
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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
