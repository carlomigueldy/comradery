import 'package:comradery/app.dart';
import 'package:comradery/app.logger.dart';
import 'package:comradery/ui/views/app/app_viewmodel.dart';
import 'package:comradery/user/models/user.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends IndexTrackingViewModel {
  final log = stackedLogger('HomeViewModel');
  final _router = locator<NavigationService>();
  final _appViewModel = locator<AppViewModel>();

  AppViewModel get appViewModel => _appViewModel;

  void toUserDetailView(User user) {
    _router.navigateTo(
      Routes.userDetailView(userId: user.id!),
    );
  }

  void toNotificationsView() {
    _router.navigateTo(Routes.notificationsView);
  }
}
