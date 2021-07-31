import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/user/services/user_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase/supabase.dart';

class HomeViewModel extends BaseViewModel {
  final log = Logger();
  final _authService = locator<AuthService>();
  final _userService = locator<UserService>();
  final _router = locator<NavigationService>();

  List<User> _users = [];
  List<User> get users => _users;
  String get _fetchUsersKey => '_fetchUsersKey';
  bool get fetchUsersBusy => busy(_fetchUsersKey);

  void init() {
    fetchUsers();
  }

  void logout() {
    _authService.signOut();
    _router.replaceWith(Routes.signInView);
  }

  Future<void> fetchUsers() async {
    final response = await runBusyFuture<PostgrestResponse>(
      _userService.all(),
      busyObject: _fetchUsersKey,
      throwException: true,
    );
    log.v('response "${response.toJson()}"');

    if (response.error != null) {
      return;
    }

    _users = (response.data as List).map((e) => User.fromJson(e)).toList();
    notifyListeners();
  }
}
