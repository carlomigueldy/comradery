import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/services/app_snackbar_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/matching/models/matching.dart';
import 'package:comradery/matching/services/matching_service.dart';
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
  final _matchingService = locator<MatchingService>();
  final _snackbarService = locator<AppSnackbarService>();
  final _router = locator<NavigationService>();

  MatchEngine _matchEngine = MatchEngine(
    swipeItems: [],
  );
  MatchEngine get matchEngine => _matchEngine;

  List<User> _users = [];
  List<User> get users => _users.where((element) {
        return !matchingsTargetUserIds.contains(element.id);
      }).toList();

  String get _fetchUsersKey => '_fetchUsersKey';
  bool get fetchUsersBusy => busy(_fetchUsersKey);

  List<Matching> _matchings = [];
  List<Matching> get matchings => _matchings;
  List<String> get matchingsTargetUserIds =>
      _matchings.map((e) => e.targetUserId).toList();
  String get _fetchMatchingsKey => '_fetchMatchingsKey';
  bool get fetchMatchingsBusy => busy(_fetchMatchingsKey);

  String get _likeUserKey => '_likeUserKey';
  bool get likeUserBusy => busy(_likeUserKey);

  String get _nopeUserKey => '_nopeUserKey';
  bool get nopeUserBusy => busy(_nopeUserKey);

  String get userEmail => _authService.user?.email ?? '-';

  Future<void> init() async {
    setBusy(true);
    await Future.wait([
      fetchMatchings(),
      fetchUsers(),
    ]);
    log.v('matchingsTargetUserIds "$matchingsTargetUserIds"');
    setBusy(false);
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
          content: user.id,
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

  Future<void> fetchMatchings() async {
    final response = await runBusyFuture<sb.PostgrestResponse>(
      _matchingService.all(),
      busyObject: _fetchMatchingsKey,
      throwException: true,
    );
    log.v('response "${response.toJson()}"');

    if (response.error != null) {
      return;
    }

    _matchings =
        (response.data as List).map((e) => Matching.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> likeUser() async {
    final response = await runBusyFuture(
      _matchingService.create(
        Matching(
          targetUserId: _matchEngine.currentItem!.content,
          createdBy: _authService.user!.id!,
          liked: true,
        ).toPayload(),
      ),
      busyObject: _likeUserKey,
      throwException: true,
    );
    log.v('response "${response.toJson()}"');

    if (response.error != null) {
      return _snackbarService.showError();
    }

    _matchEngine.currentItem?.like();
  }

  Future<void> nopeUser() async {
    final response = await runBusyFuture(
      _matchingService.create(
        Matching(
          targetUserId: _matchEngine.currentItem!.content,
          createdBy: _authService.user!.id!,
          liked: false,
        ).toPayload(),
      ),
      busyObject: _likeUserKey,
      throwException: true,
    );
    log.v('response "${response.toJson()}"');

    if (response.error != null) {
      return _snackbarService.showError();
    }

    _matchEngine.currentItem?.nope();
  }

  void viewUserProfile() {
    _router.navigateTo(
      AppViewRoutes.userDetailView(
        userId: _matchEngine.currentItem!.content,
      ),
      id: AppRouterId.appView,
    );
  }

  void toConversationView() {
    _router.navigateWithTransition(
      ConversationDetailView(conversationId: '1231233'),
      transition: 'none',
      id: AppRouterId.appView,
    );
  }
}
