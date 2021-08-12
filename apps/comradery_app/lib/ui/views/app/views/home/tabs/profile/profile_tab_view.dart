import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'profile_tab_viewmodel.dart';

class ProfileTabView extends StatelessWidget with UiUtilMixin {
  const ProfileTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ViewModelBuilder<ProfileTabViewModel>.reactive(
      viewModelBuilder: () => ProfileTabViewModel(),
      builder: (
        BuildContext context,
        ProfileTabViewModel model,
        Widget? child,
      ) {
        return Padding(
          padding: uiUtil.edgeInsets.horizontalSymmetric25,
          child: Column(
            children: [
              uiUtil.verticalSpacing.large,
              Row(
                children: [
                  Text(
                    'My Profile',
                    style: uiUtil.textStyles.heading3.copyWith(
                      color: theme.primaryColor,
                    ),
                  ),
                ],
              ),
              uiUtil.verticalSpacing.large,
              AppButton(
                label: 'Logout',
                onPressed: () => model.appViewModel.logout(),
              ),
              uiUtil.verticalSpacing.large,
            ],
          ),
        );
      },
    );
  }
}
