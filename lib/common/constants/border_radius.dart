import 'package:flutter/material.dart';

const BASE_BORDER_RADIUS = 3.5;

const _none = BASE_BORDER_RADIUS * 0;

const _small = BASE_BORDER_RADIUS / 2;

const _normal = BASE_BORDER_RADIUS;

const _large = BASE_BORDER_RADIUS * 2;

const _veryLarge = BASE_BORDER_RADIUS * 3;

const _huge = BASE_BORDER_RADIUS * 4;

class AppBorderRadiusValue {
  double get none => _none;

  double get small => _small;

  double get normal => _normal;

  double get large => _large;

  double get veryLarge => _veryLarge;

  double get huge => _huge;
}

class AppBorderRadius {
  BorderRadius get none => BorderRadius.circular(_none);

  BorderRadius get small => BorderRadius.circular(_small);

  BorderRadius get normal => BorderRadius.circular(_normal);

  BorderRadius get large => BorderRadius.circular(_large);

  BorderRadius get veryLarge => BorderRadius.circular(_veryLarge);

  BorderRadius get huge => BorderRadius.circular(_huge);
}
