import 'package:comradery/common/utils/ui_util.dart';
import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget with UiUtilMixin {
  const AppBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.keyboard_arrow_left_rounded,
        color: uiUtil.colors.black,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }
}
