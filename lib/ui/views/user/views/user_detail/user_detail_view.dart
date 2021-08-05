import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/app_bar/app_top_bar.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
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
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
