import 'package:comradery/app.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SetupUserProfileViewModel extends BaseViewModel {
  final log = Logger();
  final _router = locator<NavigationService>();

  void toSelectInterestsView() {
    _router.navigateTo(Routes.selectInterestsView);
  }

  void setupUserProfile(Map<String, dynamic> value) {
    log.v('value "$value"');

    toSelectInterestsView();
  }
}
