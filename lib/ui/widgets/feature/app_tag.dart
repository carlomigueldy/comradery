import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';

enum AppTagSize {
  small,
  normal,
}

class AppTag extends StatelessWidget with UiUtilMixin {
  const AppTag({
    Key? key,
    required this.text,
    this.selected = false,
    this.size = AppTagSize.normal,
  }) : super(key: key);

  final AppTagSize size;
  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: uiUtil.edgeInsets.all10,
      decoration: BoxDecoration(
        color: selected ? theme.primaryColor : theme.accentColor,
        borderRadius: uiUtil.borderRadius.circle,
      ),
      child: AppText(
        text,
        style: uiUtil.textStyles.body.copyWith(
          color: selected ? Colors.white : theme.textTheme.bodyText1?.color,
          fontSize: size == AppTagSize.small
              ? uiUtil.textStyles.bodySmall.fontSize
              : uiUtil.textStyles.body.fontSize,
        ),
      ),
    );
  }
}
