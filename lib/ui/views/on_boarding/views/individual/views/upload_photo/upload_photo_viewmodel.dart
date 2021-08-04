import 'dart:io';

import 'package:comradery/app.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UploadPhotoViewModel extends BaseViewModel {
  final _router = locator<NavigationService>();
  final _imagePicker = ImagePicker();

  File? _file;
  File? get file => _file;
  bool get hasFile => file != null;

  void toSetupUserProfileView() {
    _router.navigateTo(Routes.setupUserProfileView);
  }

  Future<void> selectPhoto() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return;
    }

    _file = File(image.path);
    notifyListeners();
  }
}
