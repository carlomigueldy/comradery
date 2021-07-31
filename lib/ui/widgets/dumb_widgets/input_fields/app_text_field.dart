import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

enum AppTextFieldLabelType {
  basic,
  stacked,
  floating,
}

class AppTextField extends StatelessWidget with UiUtilMixin {
  const AppTextField({
    Key? key,
    required this.name,
    this.controller,
    this.focusNode,
    this.label,
    this.help,
    this.error,
    this.labelType = AppTextFieldLabelType.basic,
    this.suffixIcon,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.obscureText = false,
    this.autocorrect = false,
    this.keyboardType,
    this.backgroundColor,
    this.validator,
    this.initialValue,
    this.maxLines = 1,
    this.maxLength,
    this.height,
  }) : super(key: key);

  final String name;
  final String? label;
  final String? help;
  final String? error;
  final AppTextFieldLabelType? labelType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final ValueChanged<String?>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final FormFieldSetter<String>? onSaved;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final bool obscureText;
  final bool autocorrect;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final String? initialValue;
  final int maxLines;
  final int? maxLength;
  final double? height;

  List<Widget> get labelText {
    if (labelType == AppTextFieldLabelType.basic) {
      return [SizedBox.shrink()];
    }

    if (label == null) {
      return [SizedBox.shrink()];
    }

    return [
      Row(children: [AppText.body(label!)]),
      uiUtil.verticalSpacing.normal,
    ];
  }

  List<Widget> get captionText {
    if (error != null) {
      return [
        uiUtil.verticalSpacing.normal,
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              AppText.caption(
                error!,
                style: uiUtil.textStyles.caption.copyWith(
                  color: uiUtil.colors.error,
                ),
              )
            ],
          ),
        ),
      ];
    }

    if (help != null) {
      return [
        uiUtil.verticalSpacing.normal,
        Align(
          alignment: Alignment.topLeft,
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              AppText.caption(
                help!,
                // style: uiUtil.textStyles.caption.copyWith(
                //   fontSize: 14,
                // ),
              ),
            ],
          ),
        ),
      ];
    }

    return [SizedBox.shrink()];
  }

  Color get fillColor {
    if (error == null) {
      return uiUtil.colors.veryLightGrey;
    }

    return uiUtil.colors.error.withOpacity(0.8);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        ...labelText,
        Stack(
          children: [
            Container(
              padding: uiUtil.edgeInsets.horizontalSymmetric15,
              constraints: BoxConstraints(minHeight: height ?? 50),
              decoration: BoxDecoration(
                color: backgroundColor ?? UiUtil.isLight(context)
                    ? fillColor
                    : theme.canvasColor,
                borderRadius: uiUtil.borderRadius.huge,
              ),
            ),
            Container(
              padding: uiUtil.edgeInsets.horizontalSymmetric15,
              child: FormBuilderTextField(
                name: name,
                controller: controller,
                focusNode: focusNode,
                decoration: InputDecoration(
                  hintText: label,
                  border: InputBorder.none,
                  suffixIcon: suffixIcon,
                ),
                maxLines: maxLines,
                maxLength: maxLength,
                initialValue: initialValue,
                keyboardType: keyboardType,
                onChanged: onChanged,
                onEditingComplete: onEditingComplete,
                onSubmitted: onSubmitted,
                onSaved: onSaved,
                onTap: onTap,
                readOnly: readOnly,
                obscureText: obscureText,
                autocorrect: autocorrect,
                validator: validator,
              ),
            ),
          ],
        ),
        ...captionText,
      ],
    );
  }
}
