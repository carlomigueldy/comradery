import 'package:comradery/app.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SelectInterestsViewModel extends BaseViewModel {
  final _router = locator<NavigationService>();

  void toHomeView() {
    _router.navigateTo(Routes.homeView);
  }
}
