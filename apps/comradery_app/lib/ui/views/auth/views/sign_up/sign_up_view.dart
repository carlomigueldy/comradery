import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:responsive_builder/responsive_builder.dart';
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
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (
        BuildContext context,
        SignUpViewModel model,
        Widget? child,
      ) {
        final assetContainer = Container(
          child: Center(
            child: Image.asset(
              'assets/png/sign-up-illustration.png',
              // width: 350,
            ),
          ),
        );
        var form = Container(
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
        );
        final row = Row(
          children: [
            Expanded(
              flex: 2,
              child: assetContainer,
            ),
            Expanded(
              flex: 2,
              child: form,
            ),
          ],
        );
        return Scaffold(
          body: ScreenTypeLayout(
            mobile: Container(
              color: uiUtil.colors.backgroundColor,
              width: mediaQuery.size.width,
              height: mediaQuery.size.height,
              // padding: uiUtil.edgeInsets.horizontalSymmetric25,
              child: form,
            ),
            tablet: Container(
              color: uiUtil.colors.backgroundColor,
              width: mediaQuery.size.width,
              height: mediaQuery.size.height,
              padding: uiUtil.edgeInsets.horizontalSymmetric25,
              child: row,
            ),
            desktop: Container(
              color: uiUtil.colors.backgroundColor,
              width: mediaQuery.size.width,
              height: mediaQuery.size.height,
              padding: uiUtil.edgeInsets.horizontalSymmetric25,
              child: row,
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
    final theme = Theme.of(context);

    return FormBuilder(
      key: formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              // width: 450,
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
                    AppButton(
                      label: 'Create Account',
                      onPressed: onSubmit,
                      busy: model.isBusy,
                    ),
                    uiUtil.verticalSpacing.veryLarge,
                    uiUtil.verticalSpacing.veryLarge,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText.body("Already have an account?"),
                        uiUtil.horizontalSpacing.normal,
                        GestureDetector(
                          onTap: () => model.login(),
                          child: AppText.bodyBold(
                            'Sign In',
                            style: uiUtil.textStyles.bodyBold.copyWith(
                              color: theme.primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
