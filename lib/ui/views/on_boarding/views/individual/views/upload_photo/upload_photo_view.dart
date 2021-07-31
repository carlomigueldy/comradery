import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'upload_photo_viewmodel.dart';

class UploadPhotoView extends StatelessWidget {
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
        return Scaffold(
          body: Center(
            child: Text(
              'UploadPhotoView',
            ),
          ),
        );
      },
    );
  }
}
