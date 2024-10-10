/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/audiofile.png
  AssetGenImage get audiofile =>
      const AssetGenImage('assets/icons/audiofile.png');

  /// File path: assets/icons/blue_pen.png
  AssetGenImage get bluePen => const AssetGenImage('assets/icons/blue_pen.png');

  /// File path: assets/icons/down_cat_arrow.png
  AssetGenImage get downCatArrow =>
      const AssetGenImage('assets/icons/down_cat_arrow.png');

  /// File path: assets/icons/hashtagicon.png
  AssetGenImage get hashtagicon =>
      const AssetGenImage('assets/icons/hashtagicon.png');

  /// File path: assets/icons/home.png
  AssetGenImage get home => const AssetGenImage('assets/icons/home.png');

  /// File path: assets/icons/microphon.png
  AssetGenImage get microphon =>
      const AssetGenImage('assets/icons/microphon.png');

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');

  /// File path: assets/icons/write.png
  AssetGenImage get write => const AssetGenImage('assets/icons/write.png');

  /// File path: assets/icons/write_article.png
  AssetGenImage get writeArticle =>
      const AssetGenImage('assets/icons/write_article.png');

  /// File path: assets/icons/write_article_icon.png
  AssetGenImage get writeArticleIcon =>
      const AssetGenImage('assets/icons/write_article_icon.png');

  /// File path: assets/icons/write_microphone.png
  AssetGenImage get writeMicrophone =>
      const AssetGenImage('assets/icons/write_microphone.png');

  /// File path: assets/icons/write_podcast_icon.png
  AssetGenImage get writePodcastIcon =>
      const AssetGenImage('assets/icons/write_podcast_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        audiofile,
        bluePen,
        downCatArrow,
        hashtagicon,
        home,
        microphon,
        user,
        write,
        writeArticle,
        writeArticleIcon,
        writeMicrophone,
        writePodcastIcon
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/empty_state.png
  AssetGenImage get emptyState =>
      const AssetGenImage('assets/images/empty_state.png');

  /// File path: assets/images/poster_test.png
  AssetGenImage get posterTest =>
      const AssetGenImage('assets/images/poster_test.png');

  /// File path: assets/images/profileAvatar.png
  AssetGenImage get profileAvatar =>
      const AssetGenImage('assets/images/profileAvatar.png');

  /// File path: assets/images/single_place_holder.jpg
  AssetGenImage get singlePlaceHolder =>
      const AssetGenImage('assets/images/single_place_holder.jpg');

  /// File path: assets/images/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/images/splash.png');

  /// File path: assets/images/tcbot.svg
  SvgGenImage get tcbot => const SvgGenImage('assets/images/tcbot.svg');

  /// List of all assets
  List<dynamic> get values =>
      [emptyState, posterTest, profileAvatar, singlePlaceHolder, splash, tcbot];
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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
