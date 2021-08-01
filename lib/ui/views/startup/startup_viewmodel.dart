import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/app.locator.dart';
import 'package:comradery/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _router = locator<NavigationService>();

  Future<void> init() async {
    await _authService.initialize();
    await Future.delayed(Duration(seconds: 1));

    if (_authService.hasUser) {
      return _router.replaceWith(Routes.appView);
    }

    return _router.replaceWith(Routes.signInView);
  }
}
