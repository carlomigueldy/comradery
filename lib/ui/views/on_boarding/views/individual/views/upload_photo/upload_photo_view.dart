import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'upload_photo_viewmodel.dart';

class UploadPhotoView extends StatelessWidget with UiUtilMixin {
  const UploadPhotoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UploadPhotoViewModel>.reactive(
      viewModelBuilder: () => UploadPhotoViewModel(),
      builder: (
        BuildContext context,
        UploadPhotoViewModel model,
        Widget? child,
      ) {
        final theme = Theme.of(context);

        return Scaffold(
          body: Container(
            width: double.infinity,
            color: uiUtil.colors.backgroundColor,
            padding: uiUtil.edgeInsets.horizontalSymmetric25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                uiUtil.verticalSpacing.large,
                AppText.body(
                  'Upload your photo',
                  style: uiUtil.textStyles.heading1,
                ),
                uiUtil.verticalSpacing.large,
                Spacer(),
                InkWell(
                  onTap: () => model.selectPhoto(),
                  child: CircleAvatar(
                    backgroundColor: theme.primaryColor,
                    child: model.hasFile ? Image.file(model.file!) : null,
                    radius: 128,
                  ),
                ),
                uiUtil.verticalSpacing.large,
                uiUtil.verticalSpacing.large,
                uiUtil.verticalSpacing.large,
                uiUtil.verticalSpacing.large,
                Container(
                  width: 300,
                  child: Column(
                    children: [
                      AppButton(
                        label: 'Continue',
                        onPressed: () => model.toSetupUserProfileView(),
                      ),
                      uiUtil.verticalSpacing.large,
                      AppButton.text(
                        label: 'Skip',
                        onPressed: () => model.toSetupUserProfileView(),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                uiUtil.verticalSpacing.large,
              ],
            ),
          ),
        );
      },
    );
  }
}
