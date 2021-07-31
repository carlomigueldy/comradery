import 'package:comradery/common/constants/constants.dart';
import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/spinner/app_spinner.dart';
import 'package:flutter/material.dart';

enum AppButtonType {
  basic,
  text,
}

class AppButton extends StatelessWidget with UiUtilMixin {
  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.busy = false,
    this.disabled = false,
    this.textColor = kcWhite,
    this.color = kcPrimary,
    this.borderRadius,
  })  : variant = AppButtonType.basic,
        super(key: key);

  const AppButton.text({
    Key? key,
    required this.label,
    required this.onPressed,
    this.busy = false,
    this.disabled = false,
    this.textColor,
    this.borderRadius,
  })  : color = null,
        variant = AppButtonType.text,
        super(key: key);

  final String label;
  final bool? busy;
  final bool? disabled;
  final VoidCallback? onPressed;
  final Color? color;
  final Color? textColor;
  final BorderRadiusGeometry? borderRadius;
  final AppButtonType variant;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 100,
      onPressed: disabled! ? null : onPressed,
      // TODO: Create a disabled color variable
      disabledColor: Colors.grey[500],
      textColor: textColor ?? Theme.of(context).textTheme.bodyText1!.color,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? uiUtil.borderRadius.huge,
      ),
      child: Padding(
        padding: uiUtil.edgeInsets.all10,
        child: busy!
            ? AppSpinner(
                color: variant == AppButtonType.text
                    ? Theme.of(context).primaryColor
                    : kcWhite,
              )
            : Center(
                child: Text(
                  label,
                  style: TextStyle(
                    fontWeight: variant == AppButtonType.basic
                        ? FontWeight.normal
                        : FontWeight.normal,
                    fontSize: 16,
                    color: textColor ?? Theme.of(context).primaryColor,
                  ),
                ),
              ),
      ),
      color: variant == AppButtonType.basic
          ? Theme.of(context).primaryColor
          : null,
      height: 50,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
    );
  }
}
