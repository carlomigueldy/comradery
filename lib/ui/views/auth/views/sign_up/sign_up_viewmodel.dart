import 'package:comradery/app.dart';
import 'package:comradery/app.locator.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final log = Logger();
  final _authService = locator<AuthService>();
  final _router = locator<NavigationService>();

  Future<void> createAccountWithEmailAndPassword(
    Map<String, dynamic> value,
  ) async {
    try {
      setBusy(true);
      final user = await _authService.signUp(
        email: value['email'],
        password: value['password'],
      );

      if (user == null) {
        // TODO: Show error snackbar
        return;
      }

      return await _router.replaceWith(Routes.homeView);
    } catch (e) {
      log.e('error "$e"');
    } finally {
      setBusy(false);
    }
  }

  void login() {
    _router.replaceWith(Routes.signInView);
  }
}
