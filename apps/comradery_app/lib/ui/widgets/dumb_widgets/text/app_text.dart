import 'package:comradery/common/utils/ui_util.dart';
import 'package:flutter/material.dart';

enum AppTextType {
  heading1,
  heading2,
  heading3,
  headline,
  body,
  bodyBold,
  bodySmall,
  bodySmallBold,
  subheading,
  caption,
}

class AppText extends StatelessWidget with UiUtilMixin {
  const AppText(
    this.text, {
    Key? key,
    this.variant = AppTextType.body,
    this.style,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.maxLines,
    this.locale,
    this.semanticsLabel,
    this.textDirection,
    this.strutStyle,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const AppText.heading1(
    this.text, {
    Key? key,
    this.variant = AppTextType.heading1,
    this.style,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.maxLines,
    this.locale,
    this.semanticsLabel,
    this.textDirection,
    this.strutStyle,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const AppText.heading2(
    this.text, {
    Key? key,
    this.variant = AppTextType.heading2,
    this.style,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.maxLines,
    this.locale,
    this.semanticsLabel,
    this.textDirection,
    this.strutStyle,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const AppText.heading3(
    this.text, {
    Key? key,
    this.variant = AppTextType.heading3,
    this.style,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.maxLines,
    this.locale,
    this.semanticsLabel,
    this.textDirection,
    this.strutStyle,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const AppText.headline(
    this.text, {
    Key? key,
    this.variant = AppTextType.headline,
    this.style,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.maxLines,
    this.locale,
    this.semanticsLabel,
    this.textDirection,
    this.strutStyle,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const AppText.body(
    this.text, {
    Key? key,
    this.variant = AppTextType.body,
    this.style,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.maxLines,
    this.locale,
    this.semanticsLabel,
    this.textDirection,
    this.strutStyle,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const AppText.bodyBold(
    this.text, {
    Key? key,
    this.variant = AppTextType.bodyBold,
    this.style,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.maxLines,
    this.locale,
    this.semanticsLabel,
    this.textDirection,
    this.strutStyle,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const AppText.bodySmall(
    this.text, {
    Key? key,
    this.variant = AppTextType.bodySmall,
    this.style,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.maxLines,
    this.locale,
    this.semanticsLabel,
    this.textDirection,
    this.strutStyle,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const AppText.bodySmallBold(
    this.text, {
    Key? key,
    this.variant = AppTextType.bodySmallBold,
    this.style,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.maxLines,
    this.locale,
    this.semanticsLabel,
    this.textDirection,
    this.strutStyle,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const AppText.subheading(
    this.text, {
    Key? key,
    this.variant = AppTextType.subheading,
    this.style,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.maxLines,
    this.locale,
    this.semanticsLabel,
    this.textDirection,
    this.strutStyle,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  const AppText.caption(
    this.text, {
    Key? key,
    this.variant = AppTextType.caption,
    this.style,
    this.textAlign,
    this.overflow,
    this.softWrap,
    this.maxLines,
    this.locale,
    this.semanticsLabel,
    this.textDirection,
    this.strutStyle,
    this.textHeightBehavior,
    this.textScaleFactor,
    this.textWidthBasis,
  }) : super(key: key);

  final String text;
  final AppTextType variant;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final bool? softWrap;
  final int? maxLines;
  final Locale? locale;
  final String? semanticsLabel;
  final TextDirection? textDirection;
  final StrutStyle? strutStyle;
  final TextHeightBehavior? textHeightBehavior;
  final double? textScaleFactor;
  final TextWidthBasis? textWidthBasis;

  TextStyle get _style {
    switch (variant) {
      case AppTextType.heading1:
        return uiUtil.textStyles.heading1;
      case AppTextType.heading2:
        return uiUtil.textStyles.heading2;
      case AppTextType.heading3:
        return uiUtil.textStyles.heading3;
      case AppTextType.headline:
        return uiUtil.textStyles.headline;
      case AppTextType.body:
        return uiUtil.textStyles.body;
      case AppTextType.bodyBold:
        return uiUtil.textStyles.bodyBold;
      case AppTextType.bodySmall:
        return uiUtil.textStyles.bodySmall;
      case AppTextType.bodySmallBold:
        return uiUtil.textStyles.bodySmallBold;
      case AppTextType.subheading:
        return uiUtil.textStyles.subheading;
      case AppTextType.caption:
        return uiUtil.textStyles.caption;
      default:
        return uiUtil.textStyles.body;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: key,
      style: style ?? _style,
      textAlign: textAlign,
      overflow: overflow,
      softWrap: softWrap,
      maxLines: maxLines,
      locale: locale,
      semanticsLabel: semanticsLabel,
      textDirection: textDirection,
      strutStyle: strutStyle,
      textHeightBehavior: textHeightBehavior,
      textScaleFactor: textScaleFactor,
      textWidthBasis: textWidthBasis,
    );
  }
}
