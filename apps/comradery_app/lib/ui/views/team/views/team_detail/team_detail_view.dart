import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/app_bar/app_top_bar.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'team_detail_viewmodel.dart';

class TeamDetailView extends StatelessWidget with UiUtilMixin {
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
    final mediaQuery = MediaQuery.of(context);

    return ViewModelBuilder<TeamDetailViewModel>.reactive(
      viewModelBuilder: () => TeamDetailViewModel(),
      builder: (
        BuildContext context,
        TeamDetailViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppTopBar(
            title: 'Team Detail $teamId',
          ),
          body: Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
            color: uiUtil.colors.backgroundColor,
            child: Center(
              child: Text(
                'TeamDetailView',
              ),
            ),
          ),
        );
      },
    );
  }
}
