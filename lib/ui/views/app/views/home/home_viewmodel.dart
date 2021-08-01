import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/ui/views/conversation/views/conversation_detail/conversation_detail_view.dart';
import 'package:comradery/user/models/user.dart';
import 'package:comradery/user/services/user_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase/supabase.dart' as sb;
import 'package:swipe_cards/swipe_cards.dart';

class HomeViewModel extends BaseViewModel {
  final log = Logger();
  final _authService = locator<AuthService>();
  final _userService = locator<UserService>();
  final _router = locator<NavigationService>();

  MatchEngine _matchEngine = MatchEngine(
    swipeItems: [],
  );
  MatchEngine get matchEngine => _matchEngine;

  List<User> _users = [];
  List<User> get users => _users;
  String get _fetchUsersKey => '_fetchUsersKey';
  bool get fetchUsersBusy => busy(_fetchUsersKey);

  String get userEmail => _authService.user?.email ?? '-';

  void init() {
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    final response = await runBusyFuture<sb.PostgrestResponse>(
      _userService.all(),
      busyObject: _fetchUsersKey,
      throwException: true,
    );
    log.v('response "${response.toJson()}"');

    if (response.error != null) {
      return;
    }

    _users = (response.data as List).map((e) => User.fromJson(e)).toList();
    _matchEngine = MatchEngine(
      swipeItems: _users.map((user) {
        return SwipeItem(
          likeAction: () {
            log.v('like "${user.id}"');
          },
          nopeAction: () {
            log.v('nope "${user.id}"');
          },
        );
      }).toList(),
    );
    notifyListeners();
  }

  void viewUserProfile(String userId) {
    _router.navigateTo(
      AppViewRoutes.userDetailView(userId: userId),
      id: AppRouterId.appView,
    );
  }

  void toConversationView() {
    _router.navigateWithTransition(
      ConversationDetailView(conversationId: '1231233'),
      transition: 'none',
      id: AppRouterId.appView,
    );

    // _router.navigateTo(
    //   AppViewRoutes.conversationDetailView(conversationId: '123dddd'),
    //   id: AppRouterId.appView,
    // );
  }
}
