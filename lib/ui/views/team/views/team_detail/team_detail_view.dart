import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'team_detail_viewmodel.dart';

class TeamDetailView extends StatelessWidget {
  const TeamDetailView({
    Key? key,
    @PathParam(
      'teamId',
    )
        required this.teamId,
  }) : super(key: key);

  final String teamId;

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
          appBar: AppBar(
            title: AppText(''),
          ),
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
