import 'package:comradery/app.locator.dart';
import 'package:comradery/app.router.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase/supabase.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInViewModel extends BaseViewModel {
  final log = Logger();
  final _authService = locator<AuthService>();
  final _router = locator<NavigationService>();

  Future<void> loginWithEmail(Map<String, dynamic> value) async {
    try {
      setBusy(true);
      final user = await _authService.signIn(
        email: value['email'],
        password: value['password'],
      );

      if (user == null) {
        return;
      }

      await _router.replaceWith(Routes.homeView);
    } catch (e) {
      log.e('error "$e"');
    } finally {
      setBusy(false);
    }

    log.v('value "$value"');
  }

  Future<void> continueWithGoogle() async {
    final response = await supabase.auth.signIn(provider: Provider.google);
    log.v('response.url "${response.url}"');

    if (response.url == null) {
      return;
    }

    await launch(response.url!);

    log.v('response.rawData "${response.rawData}"');
    log.v(
      'response.data "${response.data}", response.provider ${response.provider}',
    );

    if (response.error != null) {
      return log.e(
        'response.error?.message "${response.error?.message}"',
      );
    }
  }

  void createAccount() {
    _router.replaceWith(Routes.signUpView);
  }
}
