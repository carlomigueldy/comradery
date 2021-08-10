import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/app_bar/app_top_bar.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'setup_user_profile_viewmodel.dart';

class SetupUserProfileView extends StatelessWidget with UiUtilMixin {
  final _formKey = GlobalKey<FormBuilderState>();

  SetupUserProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return ViewModelBuilder<SetupUserProfileViewModel>.reactive(
      viewModelBuilder: () => SetupUserProfileViewModel(),
      builder: (
        BuildContext context,
        SetupUserProfileViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppTopBar(
            title: '',
          ),
          body: Container(
            color: uiUtil.colors.backgroundColor,
            padding: uiUtil.edgeInsets.horizontalSymmetric25,
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
            child: _Form(
              formKey: _formKey,
              onSubmit: () {
                _formKey.currentState?.save();

                if (_formKey.currentState?.validate() == false) {
                  return;
                }

                model.setupUserProfile(_formKey.currentState!.value);
              },
            ),
          ),
        );
      },
    );
  }
}

class _Form extends HookViewModelWidget<SetupUserProfileViewModel>
    with UiUtilMixin {
  const _Form({
    Key? key,
    required this.formKey,
    this.onSubmit,
  }) : super(key: key);

  final GlobalKey<FormBuilderState> formKey;
  final Function()? onSubmit;

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    SetupUserProfileViewModel model,
  ) {
    final firstNameFocusNode = useFocusNode();
    final lastNameFocusNode = useFocusNode();
    final bioFocusNode = useFocusNode();

    final column = Column(
      children: [
        uiUtil.verticalSpacing.large,
        AppText(
          'Create your profile',
          style: uiUtil.textStyles.heading1,
        ),
        Spacer(),
        AppTextField(
          name: 'first_name',
          label: 'First Name',
          focusNode: firstNameFocusNode,
          onEditingComplete: () => lastNameFocusNode.nextFocus(),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
          ]),
        ),
        uiUtil.verticalSpacing.large,
        AppTextField(
          name: 'last_name',
          label: 'Last Name',
          focusNode: lastNameFocusNode,
          onEditingComplete: () => bioFocusNode.nextFocus(),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
          ]),
        ),
        uiUtil.verticalSpacing.large,
        AppTextField(
          name: 'bio',
          label: 'Bio',
          height: 140,
          maxLines: 6,
          focusNode: bioFocusNode,
          onEditingComplete: onSubmit,
        ),
        uiUtil.verticalSpacing.large,
        AppButton(
          label: 'Continue',
          onPressed: onSubmit,
          busy: model.isBusy,
        ),
        Spacer(),
        uiUtil.verticalSpacing.large,
      ],
    );

    return FormBuilder(
      key: formKey,
      child: column,
    );
  }
}
