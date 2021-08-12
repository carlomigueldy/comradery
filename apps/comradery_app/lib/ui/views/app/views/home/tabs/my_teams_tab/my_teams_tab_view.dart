import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/views/app/widgets/tabs/my_teams_tab_view_layout_builder.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'my_teams_tab_viewmodel.dart';

class MyTeamsTabView extends StatelessWidget with UiUtilMixin {
  const MyTeamsTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ViewModelBuilder<MyTeamsTabViewModel>.reactive(
      viewModelBuilder: () => MyTeamsTabViewModel(),
      builder: (
        BuildContext context,
        MyTeamsTabViewModel model,
        Widget? child,
      ) {
        return Container(
          padding: uiUtil.edgeInsets.horizontalSymmetric25,
          child: model.appViewModel.fetchMyTeamsBusy
              ? AppSpinner()
              : Column(
                  children: [
                    uiUtil.verticalSpacing.large,
                    Row(
                      children: [
                        Text(
                          'My Teams',
                          style: uiUtil.textStyles.heading3.copyWith(
                            color: theme.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    uiUtil.verticalSpacing.large,
                    MyTeamsTabViewLayoutBuilder(
                      teams: model.appViewModel.myTeams,
                    ),
                    uiUtil.verticalSpacing.huge,
                  ],
                ),
        );
      },
    );
  }
}
