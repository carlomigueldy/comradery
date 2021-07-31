import 'package:flutter/material.dart';

const BASE_SPACING_VALUE = 5.0;

class AppSpacingValue {
  static const none = BASE_SPACING_VALUE * 0;

  static const small = BASE_SPACING_VALUE / 2;

  static const normal = BASE_SPACING_VALUE;

  static const large = BASE_SPACING_VALUE * 4;

  static const veryLarge = large * 3;

  static const huge = veryLarge * 4;
}

class AppVerticalSpacing {
  SizedBox get none => SizedBox(height: AppSpacingValue.none);

  SizedBox get small => SizedBox(height: AppSpacingValue.small);

  SizedBox get normal => SizedBox(height: AppSpacingValue.normal);

  SizedBox get large => SizedBox(height: AppSpacingValue.large);

  SizedBox get veryLarge => SizedBox(height: AppSpacingValue.veryLarge);

  SizedBox get huge => SizedBox(height: AppSpacingValue.huge);
}

class AppHorizontalSpacing {
  SizedBox get none => SizedBox(width: AppSpacingValue.none);

  SizedBox get small => SizedBox(width: AppSpacingValue.small);

  SizedBox get normal => SizedBox(width: AppSpacingValue.normal);

  SizedBox get large => SizedBox(width: AppSpacingValue.large);

  SizedBox get veryLarge => SizedBox(width: AppSpacingValue.veryLarge);

  SizedBox get huge => SizedBox(width: AppSpacingValue.huge);
}
