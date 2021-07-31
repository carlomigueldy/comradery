import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sign_up_viewmodel.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(
      viewModelBuilder: () => SignUpViewModel(),
      builder: (
        BuildContext context,
        SignUpViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'SignUpView',
            ),
          ),
        );
      },
    );
  }
}
