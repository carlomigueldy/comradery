import 'package:flutter/material.dart';

/// Option #1: Dark Color Scheme [https://colorhunt.co/palette/1a1a2e16213e0f3460e94560]
/// Option #2: Dark Color Scheme [https://colorhunt.co/palette/1d2d50133b5c1e5f74fcdab7]
const Color kcWhite = Colors.white;
const Color kcBlack = Colors.black;
const Color kcRed = Colors.red;
const Color kcPrimary = Color(0xffDC2D28);
const Color kcMediumGrey = Color(0xff868686);
const Color kcLightGrey = Color(0xffe5e5e5);
const Color kcVeryLightGrey = Color(0xfff2f2f2);
const Color kcDarkGrey = Color(0xff121212);
const Color kcLightBackgroundColor = kcWhite;
const Color kcDarkBackgroundColor = Color(0xff1D2D50);
const Color kcDarkContainerColor = Color(0xff133B5C);

class AppColor {
  Color get lightBackgroundColor => kcLightBackgroundColor;

  Color get darkBackgroundColor => kcDarkBackgroundColor;

  Color get darkContainerColor => kcDarkContainerColor;

  Color get white => kcWhite;

  Color get black => kcBlack;

  Color get error => kcRed;

  Color get primary => kcPrimary;

  Color get mediumGray => kcMediumGrey;

  Color get lightGrey => kcLightGrey;

  Color get veryLightGrey => kcVeryLightGrey;

  Color get darkGrey => kcDarkGrey;
}
