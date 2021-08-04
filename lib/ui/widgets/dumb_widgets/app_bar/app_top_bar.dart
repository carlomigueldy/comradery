import 'package:comradery/app.dart';
import 'package:comradery/common/utils/ui_util.dart';
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
  }) : super(key: key);

  final String title;
  final Color? backgroundColor;
  final Widget? leading;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: backgroundColor ?? uiUtil.colors.backgroundColor,
      elevation: 0,
      leading: leading ??
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left_rounded,
              color: uiUtil.colors.black,
            ),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              AppViewRoutes.homeView,
              (route) => false,
            ),
            // onPressed: () =>
            //     Navigator.canPop(context) ? Navigator.pop(context) : null,
          ),
      centerTitle: true,
      title: Text(
        title,
        style: uiUtil.textStyles.bodyBold.copyWith(
          color: theme.primaryColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
