import 'package:comradery/common/utils/ui_util.dart';
import 'package:comradery/ui/widgets/dumb_widgets/app_bar/app_top_bar.dart';
import 'package:comradery/ui/widgets/dumb_widgets/button/app_button.dart';
import 'package:comradery/ui/widgets/dumb_widgets/dumb_widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'upload_team_photo_viewmodel.dart';

class UploadTeamPhotoView extends StatelessWidget with UiUtilMixin {
  const UploadTeamPhotoView({
    Key? key,
    this.onBoarding = true,
  }) : super(key: key);
  final bool onBoarding;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UploadTeamPhotoViewModel>.reactive(
      viewModelBuilder: () => UploadTeamPhotoViewModel(onBoarding: onBoarding),
      builder: (
        BuildContext context,
        UploadTeamPhotoViewModel model,
        Widget? child,
      ) {
        final theme = Theme.of(context);

        return Scaffold(
          appBar: AppTopBar(
            title: '',
          ),
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
                  'Upload your Camaraderie photo',
                  style: uiUtil.textStyles.heading1,
                ),
                uiUtil.verticalSpacing.large,
                Spacer(),
                InkWell(
                  onTap: () => model.selectPhoto(),
                  child: CircleAvatar(
                    backgroundColor: theme.primaryColor,
                    backgroundImage:
                        model.hasFile ? FileImage(model.file!) : null,
                    // backgroundImage:
                    //     model.hasBytes ? MemoryImage(model.bytes!) : null,
                    // child: model.hasFile ? Image.file(model.file!) : null,
                    // child: model.hasBytes
                    //     ? Image.memory(
                    //         Uint8List.fromList(model.bytes!),
                    //       )
                    //     : null,
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
                        onPressed: () => model.proceed(),
                        busy: model.uploadPhotoBusy,
                      ),
                      uiUtil.verticalSpacing.large,
                      AppButton.text(
                        label: 'Skip',
                        onPressed: () => model.proceed(),
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
