import 'package:comradery/app.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SelectGoalViewModel extends BaseViewModel {
  final _router = locator<NavigationService>();

  void toUploadPhotoView() {
    _router.navigateTo(Routes.uploadPhotoView);
  }
}
