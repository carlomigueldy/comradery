import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'sign_up_viewmodel.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> with UiUtilMixin {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (
        BuildContext context,
        SignUpViewModel model,
        Widget? child,
      ) {
        final theme = Theme.of(context);

        return GestureDetector(
          onTap: () => uiUtil.dismissKeyboard(context),
          child: Scaffold(
            body: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: _Form(
                      formKey: _formKey,
                      onSubmit: () {
                        _formKey.currentState?.save();

                        if (_formKey.currentState?.validate() == false) {
                          return;
                        }

                        model.createAccountWithEmailAndPassword(
                            _formKey.currentState!.value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Form extends HookViewModelWidget<SignUpViewModel> with UiUtilMixin {
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
    SignUpViewModel model,
  ) {
    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    return FormBuilder(
      key: formKey,
      child: SingleChildScrollView(
        padding: uiUtil.edgeInsets.horizontalSymmetric25,
        child: Column(
          children: [
            uiUtil.verticalSpacing.large,
            Row(children: [
              AppText.body(
                'Sign Up',
                style: uiUtil.textStyles.body.copyWith(
                  fontSize: 32,
                ),
              ),
            ]),
            uiUtil.verticalSpacing.large,
            AppTextField(
              name: 'email',
              label: 'Email',
              focusNode: emailFocusNode,
              onEditingComplete: () => passwordFocusNode.nextFocus(),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
                FormBuilderValidators.email(context),
              ]),
            ),
            uiUtil.verticalSpacing.large,
            AppTextField(
              name: 'password',
              label: 'Password',
              obscureText: true,
              onEditingComplete: onSubmit,
              focusNode: passwordFocusNode,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context),
              ]),
            ),
            uiUtil.verticalSpacing.large,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                AppText('Forgot password?'),
                uiUtil.horizontalSpacing.large,
                AppButton(
                  label: 'Create Account',
                  onPressed: onSubmit,
                  busy: model.isBusy,
                ),
              ],
            ),
            uiUtil.verticalSpacing.large,
            Row(
              children: [
                AppText.body("Already have an account?"),
                uiUtil.horizontalSpacing.large,
                AppButton.text(
                  label: 'Sign In',
                  onPressed: () => model.login(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
