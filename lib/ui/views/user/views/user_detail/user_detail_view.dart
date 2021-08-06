import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/app_bar/app_top_bar.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:comradery/ui/widgets/feature/app_matching_card.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'user_detail_viewmodel.dart';

class UserDetailView extends StatelessWidget with UiUtilMixin {
  const UserDetailView({
    Key? key,
    @PathParam('userId') this.userId,
  }) : super(key: key);

  final String? userId;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return ViewModelBuilder<UserDetailViewModel>.reactive(
      onModelReady: (model) => model.init(),
      viewModelBuilder: () => UserDetailViewModel(
        userId: userId,
      ),
      builder: (
        BuildContext context,
        UserDetailViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppTopBar(
            title: model.fetchUserBusy
                ? 'Loading...'
                : (model.user?.fullName ?? '...'),
            action: PopupMenuButton(
              padding: uiUtil.edgeInsets.horizontalSymmetric25,
              shape: RoundedRectangleBorder(
                borderRadius: uiUtil.borderRadius.large,
              ),
              child: Padding(
                padding: uiUtil.edgeInsets.horizontalSymmetric25,
                child: Icon(
                  Icons.more_horiz_rounded,
                  color: uiUtil.colors.black,
                ),
              ),
              onSelected: (value) async {
                switch (value) {
                  case 'start_conversation':
                    return model.startConversation();

                  case 'invite_to_team':
                    return model.inviteToTeam();

                  case 'request_to_join_team':
                    return model.requestToJoinTeam();

                  default:
                    return;
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'start_conversation',
                    child: Text('Start Conversation'),
                  ),
                  // PopupMenuItem(
                  //   value: 'invite_to_team',
                  //   child: Text('Invite to Team'),
                  // ),
                  // PopupMenuItem(
                  //   value: 'request_to_join_team',
                  //   child: Text('Request to Join Team'),
                  // ),
                ];
              },
            ),
          ),
          body: Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
            color: uiUtil.colors.backgroundColor,
            padding: uiUtil.edgeInsets.horizontalSymmetric25,
            child: model.fetchUserBusy
                ? AppSpinner()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppMatchingCard(
                        user: model.user!,
                        showActionButtons: false,
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
