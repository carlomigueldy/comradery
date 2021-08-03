import 'package:flutter/material.dart';

class AppBoxShadows {
  BoxShadow get small => BoxShadow(
        color: Colors.black.withOpacity(0.2),
        blurRadius: 5.0,
        spreadRadius: 0.5,
        offset: Offset(0, 3),
      );

  BoxShadow get normal => BoxShadow(
        color: Colors.black.withOpacity(0.15),
        blurRadius: 10.0,
        spreadRadius: 0.15,
        offset: Offset(0, 6),
      );
}
