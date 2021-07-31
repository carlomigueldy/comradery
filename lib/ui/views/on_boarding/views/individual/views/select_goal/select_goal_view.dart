import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'select_goal_viewmodel.dart';

class SelectGoalView extends StatelessWidget with UiUtilMixin {
  const SelectGoalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectGoalViewModel>.reactive(
      viewModelBuilder: () => SelectGoalViewModel(),
      builder: (
        BuildContext context,
        SelectGoalViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            child: SingleChildScrollView(
              padding: uiUtil.edgeInsets.horizontalSymmetric25,
              child: Column(
                children: [
                  uiUtil.verticalSpacing.large,
                  AppText.body("What's your goal?"),
                  uiUtil.verticalSpacing.large,
                  Container(
                    width: 300,
                    child: AppButton(
                      label: 'Continue',
                      onPressed: () => model.toUploadPhotoView(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
