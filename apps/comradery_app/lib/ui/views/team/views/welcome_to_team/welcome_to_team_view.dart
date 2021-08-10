import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'welcome_to_team_viewmodel.dart';

class WelcomeToTeamView extends StatelessWidget {
  const WelcomeToTeamView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WelcomeToTeamViewModel>.reactive(
      viewModelBuilder: () => WelcomeToTeamViewModel(),
      builder: (
        BuildContext context,
        WelcomeToTeamViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'WelcomeToTeamView',
            ),
          ),
        );
      },
    );
  }
}
