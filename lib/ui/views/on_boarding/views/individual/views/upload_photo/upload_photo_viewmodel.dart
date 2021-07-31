import 'package:comradery/app.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UploadPhotoViewModel extends BaseViewModel {
  final _router = locator<NavigationService>();

  void toSetupUserProfileView() {
    _router.navigateTo(Routes.setupUserProfileView);
  }
}
