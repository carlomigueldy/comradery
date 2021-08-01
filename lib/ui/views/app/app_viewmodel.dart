import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AppViewModel extends BaseViewModel {
  final log = Logger();
  final _authService = locator<AuthService>();
  final _router = locator<NavigationService>();

  String get userEmail => _authService.user?.email ?? '-';

  void logout() {
    _authService.signOut();
    _router.replaceWith(Routes.signInView);
  }
}
