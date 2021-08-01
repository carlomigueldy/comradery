import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'team_detail_viewmodel.dart';

class TeamDetailView extends StatelessWidget {
  const TeamDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TeamDetailViewModel>.reactive(
      viewModelBuilder: () => TeamDetailViewModel(),
      builder: (
        BuildContext context,
        TeamDetailViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'TeamDetailView',
            ),
          ),
        );
      },
    );
  }
}
