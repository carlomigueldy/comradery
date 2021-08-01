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

  void toConversationDetailView(int value) {
    _router.navigateTo(
      AppViewRoutes.conversationDetailView(conversationId: 'value$value'),
      id: AppRouterId.appView,
    );
  }

  void toUserDetailView(int value) {
    _router.navigateTo(
      AppViewRoutes.userDetailView(userId: 'value$value'),
      id: AppRouterId.appView,
    );
  }

  void toTeamDetailView(int value) {
    _router.navigateTo(
      AppViewRoutes.teamDetailView(teamId: 'value$value'),
      id: AppRouterId.appView,
    );
  }
}
