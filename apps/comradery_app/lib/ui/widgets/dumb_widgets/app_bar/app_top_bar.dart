import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_back_button.dart';
import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget
    with UiUtilMixin
    implements PreferredSizeWidget {
  const AppTopBar({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.height = 60.0,
    this.leading,
    this.action,
  }) : super(key: key);

  final String title;
  final Color? backgroundColor;
  final Widget? leading;
  final Widget? action;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: backgroundColor ?? uiUtil.colors.backgroundColor,
      elevation: 0,
      leading: leading ?? (Navigator.canPop(context) ? AppBackButton() : null),
      centerTitle: true,
      title: Text(
        title,
        style: uiUtil.textStyles.bodyBold.copyWith(
          color: theme.primaryColor,
        ),
      ),
      actions: [action ?? SizedBox.shrink()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
