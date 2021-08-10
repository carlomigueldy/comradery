import 'dart:typed_data';

import 'package:comradery/app.dart';
import 'package:comradery/app.logger.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:file_picker/file_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:universal_io/io.dart';

abstract class OnBoardingViewModel extends BaseViewModel {
  final log = stackedLogger('OnBoardingViewModel');
  final router = locator<NavigationService>();
  final authService = locator<AuthService>();

  File? _file;
  File? get file => _file;
  String? get filePath => file?.path;
  bool get hasFile => file != null;

  Uint8List? _bytes;
  Uint8List? get bytes => _bytes;
  bool get hasBytes => bytes != null;

  String get uploadPhotoKey => 'uploadPhotoKey';
  bool get uploadPhotoBusy => busy(uploadPhotoKey);

  Future<void> selectPhoto() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) {
      return;
    }

    // _bytes = result.files.first.bytes;
    // _file = File.fromRawPath(_bytes!);
    // _file = File('qwe');

    _file = File(result.files.first.path!);
    notifyListeners();
  }
}
