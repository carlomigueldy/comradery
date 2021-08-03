import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'sign_in_viewmodel.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> with UiUtilMixin {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (
        BuildContext context,
        SignInViewModel model,
        Widget? child,
      ) {
        final theme = Theme.of(context);

        return Scaffold(
          body: Container(
            color: uiUtil.colors.backgroundColor,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        // color: theme.primaryColor,
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

                        model.loginWithEmail(_formKey.currentState!.value);
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

class _Form extends HookViewModelWidget<SignInViewModel> with UiUtilMixin {
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
    SignInViewModel model,
  ) {
    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    return FormBuilder(
      key: formKey,
      child: SingleChildScrollView(
        padding: uiUtil.edgeInsets.horizontalSymmetric25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 450,
              child: Column(
                children: [
                  uiUtil.verticalSpacing.large,
                  Row(children: [
                    AppText.body(
                      'Login',
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
                        label: 'Login',
                        onPressed: onSubmit,
                        busy: model.isBusy,
                      ),
                    ],
                  ),
                  uiUtil.verticalSpacing.large,
                  Row(
                    children: [
                      AppText.body("Don't have an account?"),
                      uiUtil.horizontalSpacing.large,
                      AppButton.text(
                        label: 'Create Account',
                        onPressed: () => model.createAccount(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
