import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'setup_user_profile_viewmodel.dart';

class SetupUserProfileView extends StatelessWidget {
  const SetupUserProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetupUserProfileViewModel>.reactive(
      viewModelBuilder: () => SetupUserProfileViewModel(),
      builder: (
        BuildContext context,
        SetupUserProfileViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'SetupUserProfileView',
            ),
          ),
        );
      },
    );
  }
}
