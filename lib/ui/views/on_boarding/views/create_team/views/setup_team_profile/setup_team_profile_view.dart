import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'setup_team_profile_viewmodel.dart';

class SetupTeamProfileView extends StatelessWidget {
  const SetupTeamProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SetupTeamProfileViewModel>.reactive(
      viewModelBuilder: () => SetupTeamProfileViewModel(),
      builder: (
        BuildContext context,
        SetupTeamProfileViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'SetupTeamProfileView',
            ),
          ),
        );
      },
    );
  }
}
