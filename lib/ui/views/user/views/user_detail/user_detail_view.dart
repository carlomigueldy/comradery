import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/app_bar/app_top_bar.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
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
            title: 'userId',
          ),
          body: Container(
            width: mediaQuery.size.width,
            height: mediaQuery.size.height,
            color: uiUtil.colors.backgroundColor,
            child: SingleChildScrollView(
              padding: uiUtil.edgeInsets.horizontalSymmetric25,
              child: Column(
                children: [
                  uiUtil.verticalSpacing.large,
                  AppButton(
                    label: 'Start Converastion',
                    onPressed: () => model.startConversation(),
                  ),
                  uiUtil.verticalSpacing.large,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
