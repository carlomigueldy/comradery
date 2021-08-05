import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/app_bar/app_top_bar.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'setup_team_profile_viewmodel.dart';

class SetupTeamProfileView extends StatelessWidget with UiUtilMixin {
  final _formKey = GlobalKey<FormBuilderState>();

  SetupTeamProfileView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return ViewModelBuilder<SetupTeamProfileViewModel>.reactive(
      viewModelBuilder: () => SetupTeamProfileViewModel(),
      builder: (
        BuildContext context,
        SetupTeamProfileViewModel model,
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

                model.createTeam(_formKey.currentState!.value);
              },
            ),
          ),
        );
      },
    );
  }
}

class _Form extends HookViewModelWidget<SetupTeamProfileViewModel>
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
    SetupTeamProfileViewModel model,
  ) {
    final nameFocusNode = useFocusNode();
    final descriptionFocusNode = useFocusNode();

    final column = Column(
      children: [
        uiUtil.verticalSpacing.large,
        AppText(
          'Create your Camaraderie',
          style: uiUtil.textStyles.heading1,
        ),
        uiUtil.verticalSpacing.veryLarge,
        AppTextField(
          name: 'name',
          label: 'Name',
          help: 'Required',
          focusNode: nameFocusNode,
          onEditingComplete: () => descriptionFocusNode.nextFocus(),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
          ]),
        ),
        uiUtil.verticalSpacing.large,
        AppTextField(
          name: 'description',
          label: 'Description',
          height: 150,
          maxLines: 6,
          focusNode: descriptionFocusNode,
        ),
        uiUtil.verticalSpacing.large,
        Spacer(),
        uiUtil.verticalSpacing.large,
        AppButton(
          label: 'Continue',
          onPressed: onSubmit,
          busy: model.isBusy,
        ),
        uiUtil.verticalSpacing.large,
      ],
    );

    return FormBuilder(
      key: formKey,
      child: column,
    );
  }
}
