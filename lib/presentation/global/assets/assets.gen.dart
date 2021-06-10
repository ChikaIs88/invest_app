/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesHomeGen get home => const $AssetsImagesHomeGen();
  $AssetsImagesLoginGen get login => const $AssetsImagesLoginGen();
  $AssetsImagesStartupGen get startup => const $AssetsImagesStartupGen();
}

class $AssetsImagesHomeGen {
  const $AssetsImagesHomeGen();

  AssetGenImage get analysis =>
      const AssetGenImage('assets/images/home/analysis.png');
  AssetGenImage get cardbg =>
      const AssetGenImage('assets/images/home/cardbg.png');
  AssetGenImage get chat => const AssetGenImage('assets/images/home/chat.png');
  AssetGenImage get homewelcome =>
      const AssetGenImage('assets/images/home/homewelcome.png');
  AssetGenImage get productlist =>
      const AssetGenImage('assets/images/home/productlist.png');
  AssetGenImage get samplecompany =>
      const AssetGenImage('assets/images/home/samplecompany.png');
}

class $AssetsImagesLoginGen {
  const $AssetsImagesLoginGen();

  SvgGenImage get loginbg =>
      const SvgGenImage('assets/images/login/loginbg.svg');
  AssetGenImage get register =>
      const AssetGenImage('assets/images/login/register.png');
  AssetGenImage get welcome =>
      const AssetGenImage('assets/images/login/welcome.png');
}

class $AssetsImagesStartupGen {
  const $AssetsImagesStartupGen();

  AssetGenImage get help =>
      const AssetGenImage('assets/images/startup/Help.png');
  AssetGenImage get money =>
      const AssetGenImage('assets/images/startup/Money.png');
  AssetGenImage get nomad =>
      const AssetGenImage('assets/images/startup/Nomad.png');
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/startup/onboarding1.png');
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/startup/onboarding2.png');
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/startup/onboarding3.png');
  SvgGenImage get onboardingbg =>
      const SvgGenImage('assets/images/startup/onboardingbg.svg');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName) : super(assetName);

  Image image({
    Key? key,
    ImageFrameBuilder? frameBuilder,
    ImageLoadingBuilder? loadingBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? width,
    double? height,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
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
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
    );
  }

  String get path => _assetName;
}
