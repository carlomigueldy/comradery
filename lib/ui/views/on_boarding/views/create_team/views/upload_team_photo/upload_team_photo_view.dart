import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'upload_team_photo_viewmodel.dart';

class UploadTeamPhotoView extends StatelessWidget {
  const UploadTeamPhotoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UploadTeamPhotoViewModel>.reactive(
      viewModelBuilder: () => UploadTeamPhotoViewModel(),
      builder: (
        BuildContext context,
        UploadTeamPhotoViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          body: Center(
            child: Text(
              'UploadTeamPhotoView',
            ),
          ),
        );
      },
    );
  }
}
