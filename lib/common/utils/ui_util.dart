import 'package:comradery/common/constants/box_shadows.dart';
import 'package:comradery/common/constants/constants.dart';
import 'package:flutter/material.dart';

class UiUtil {
  AppBorderRadius get borderRadius => AppBorderRadius();

  AppBorderRadiusValue get borderRadiusValue => AppBorderRadiusValue();

  AppColor get colors => AppColor();

  AppEdgeInsets get edgeInsets => AppEdgeInsets();

  AppSpacingValue get spacing => AppSpacingValue();

  AppVerticalSpacing get verticalSpacing => AppVerticalSpacing();

  AppHorizontalSpacing get horizontalSpacing => AppHorizontalSpacing();

  AppTextStyle get textStyles => AppTextStyle();

  AppBoxShadows get boxShadows => AppBoxShadows();

  static isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static isLight(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  void dismissKeyboard(BuildContext context) {
    return FocusScope.of(context).requestFocus(FocusNode());
  }
}

mixin UiUtilMixin {
  UiUtil get uiUtil => UiUtil();
}
