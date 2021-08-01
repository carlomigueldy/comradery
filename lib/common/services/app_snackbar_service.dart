import 'package:comradery/app.dart';
import 'package:stacked_services/stacked_services.dart';

class AppSnackbarService {
  final _snackbarService = locator<SnackbarService>();

  void show(String message) {
    _snackbarService.showSnackbar(message: message);
  }

  void showError([String? message]) {
    _snackbarService.showSnackbar(
      message: message ?? 'An error has occurred.',
    );
  }
}
