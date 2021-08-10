import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/services/app_snackbar_service.dart';
import 'package:comradery/user/services/user_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SetupUserProfileViewModel extends BaseViewModel {
  final log = Logger();
  final _userService = locator<UserService>();
  final _authService = locator<AuthService>();
  final _snackbarService = locator<AppSnackbarService>();
  final _router = locator<NavigationService>();

  Future<void> setupUserProfile(Map<String, dynamic> value) async {
    log.v('value "$value"');

    setBusy(true);

    try {
      final response = await _userService.update(
        id: _authService.user!.id!,
        json: value,
      );

      if (response.error != null) {
        _snackbarService.showError();
        return log.e(response.error?.message);
      }

      await _authService.initialize();

      toSelectInterestsView();
    } catch (e) {
      _snackbarService.showUnexpectedError();
      log.e('error "$e"');
    } finally {
      setBusy(false);
    }
  }

  void toSelectInterestsView() {
    _router.navigateTo(Routes.selectInterestsView);
  }
}
