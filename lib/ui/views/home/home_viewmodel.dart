import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _router = locator<NavigationService>();

  void logout() {
    _authService.signOut();
    _router.replaceWith(Routes.signInView);
  }
}
