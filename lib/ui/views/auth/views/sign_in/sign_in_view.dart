import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'sign_in_viewmodel.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      viewModelBuilder: () => SignInViewModel(),
      builder: (
        BuildContext context,
        SignInViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'LoginView',
            ),
          ),
        );
      },
    );
  }
}
