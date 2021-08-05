import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/app.locator.dart';
import 'package:comradery/app.router.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final log = Logger();
  final _authService = locator<AuthService>();
  final _router = locator<NavigationService>();

  StartupViewModel({
    this.accessToken,
    this.expiresIn,
    this.providerToken,
    this.refreshToken,
    this.tokenType,
  });

  final String? accessToken;
  final String? expiresIn;
  final String? providerToken;
  final String? refreshToken;
  final String? tokenType;

  Future<void> init() async {
    log.v(
      'accessToken "$accessToken"\n'
      'expiresIn "$expiresIn"\n'
      'providerToken "$providerToken"'
      'refreshToken "$refreshToken"'
      'tokenType "$tokenType"',
    );

    await _authService.initialize();
    await Future.delayed(Duration(seconds: 1));

    if (_authService.hasUser) {
      return _router.replaceWith(Routes.homeView);
    }

    return _router.replaceWith(Routes.landingView);
  }
}
