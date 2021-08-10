import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LandingViewModel extends BaseViewModel {
  final log = Logger();
  final _authService = locator<AuthService>();
  final _router = locator<NavigationService>();

  void init() async {
    await _authService.initialize();

    if (_authService.hasUser) {
      return _router.replaceWith(Routes.homeView);
    }
  }

  void toSignUpView() {
    _router.navigateTo(Routes.signUpView);
  }

  void toSignInView() {
    _router.navigateTo(Routes.signInView);
  }

  toAboutUsView() {}
}
