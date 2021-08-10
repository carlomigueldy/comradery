import 'package:flutter/cupertino.dart';

class AppTextStyle {
  TextStyle get heading1 => TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w400,
      );

  TextStyle get heading2 => TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      );

  TextStyle get heading3 => TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  TextStyle get headline => TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
      );

  TextStyle get body => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );

  TextStyle get subheading => TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      );

  TextStyle get caption => TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  // TODO:
  TextStyle get bodyBold => TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      );

  // TODO:
  TextStyle get bodySmall => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );

  // TODO:
  TextStyle get bodySmallBold => TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );
}
