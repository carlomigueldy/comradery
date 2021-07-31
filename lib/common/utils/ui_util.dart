import 'package:comradery/common/constants/constants.dart';

class UiUtil {
  AppBorderRadius get borderRadius => AppBorderRadius();

  AppBorderRadiusValue get borderRadiusValue => AppBorderRadiusValue();

  AppColor get colors => AppColor();

  AppEdgeInsets get edgeInsets => AppEdgeInsets();

  AppSpacingValue get spacing => AppSpacingValue();

  AppVerticalSpacing get verticalSpacing => AppVerticalSpacing();

  AppHorizontalSpacing get horizontalSpacing => AppHorizontalSpacing();

  AppTextStyle get textStyles => AppTextStyle();
}

mixin UiUtilMixin {
  UiUtil get uiUtil => UiUtil();
}
