import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/app_bar/app_top_bar.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'notifications_viewmodel.dart';

class NotificationsView extends StatelessWidget with UiUtilMixin {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return ViewModelBuilder<NotificationsViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => NotificationsViewModel(),
      builder: (
        BuildContext context,
        NotificationsViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppTopBar(
            title: 'Notifications',
          ),
          body: Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
            color: uiUtil.colors.backgroundColor,
            padding: uiUtil.edgeInsets.horizontalSymmetric10,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  uiUtil.verticalSpacing.large,
                  ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: model.teamRequests.length,
                    itemBuilder: (context, index) {
                      final teamRequest = model.teamRequests[index];
                      final team = teamRequest.team;

                      return ListTile(
                        title: AppText(team?.name ?? '-'),
                        subtitle: AppText('You have been invited to join'),
                        trailing: Container(
                          width: 120,
                          child: AppButton(
                            label: 'Accept',
                            onPressed: () => model.acceptInvite(team!.id!),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return uiUtil.verticalSpacing.large;
                    },
                  ),
                  uiUtil.verticalSpacing.huge,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
