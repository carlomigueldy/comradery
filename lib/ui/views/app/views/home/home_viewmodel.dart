import 'package:comradery/app.dart';
import 'package:comradery/app.logger.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/services/app_snackbar_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/matching/models/matching.dart';
import 'package:comradery/matching/services/matching_service.dart';
import 'package:comradery/ui/views/app/app_viewmodel.dart';
import 'package:comradery/ui/views/conversation/views/conversation_detail/conversation_detail_view.dart';
import 'package:comradery/user/models/user.dart';
import 'package:comradery/user/services/user_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase/supabase.dart' as sb;
import 'package:swipe_cards/swipe_cards.dart';

class HomeViewModel extends BaseViewModel {
  final log = stackedLogger('HomeViewModel');
  final _authService = locator<AuthService>();
  final _userService = locator<UserService>();
  final _matchingService = locator<MatchingService>();
  final _snackbarService = locator<AppSnackbarService>();
  final _router = locator<NavigationService>();
  final _appViewModel = locator<AppViewModel>();

  AppViewModel get appViewModel => _appViewModel;

  MatchEngine _matchEngine = MatchEngine(
    swipeItems: [],
  );
  MatchEngine get matchEngine => _matchEngine;

  List<SwipeItem> _swipeItems = [];
  List<SwipeItem> get swipeItems => _swipeItems;

  List<User> _users = [];
  List<User> get users => _users.where((element) {
        return !matchingsTargetUserIds.contains(element.id);
      }).toList();
  List<String> get userIds => users.map((e) => e.id!).toList();

  String get _fetchUsersKey => '_fetchUsersKey';
  bool get fetchUsersBusy => busy(_fetchUsersKey);

  List<Matching> _matchings = [];
  List<Matching> get matchings => _matchings;
  List<String> get matchingsTargetUserIds =>
      _matchings.map((e) => e.targetUserId).toList();
  String get _fetchMyMatchingsKey => '_fetchMyMatchingsKey';
  bool get fetchMyMatchingsBusy => busy(_fetchMyMatchingsKey);

  String get _likeUserKey => '_likeUserKey';
  bool get likeUserBusy => busy(_likeUserKey);

  String get _nopeUserKey => '_nopeUserKey';
  bool get nopeUserBusy => busy(_nopeUserKey);

  String get userEmail => _authService.user?.email ?? '-';

  Matching? _recentMatching;
  Matching? get recentMatching => _recentMatching;

  Future<void> init() async {
    await _appViewModel.init();

    setBusy(true);
    await fetchMyMatchings();
    await fetchUsers();

    // INSERT
    // supabase
    //     .from(
    //   '${_matchingService.table}:created_by=eq.${_authService.user?.id}',
    // )
    //     .on(sb.SupabaseEventTypes.insert, (payload) async {
    //   log.v('payload?.newRecord "${payload.newRecord}"');
    //   final matching = Matching.fromJson(payload.newRecord);
    //   _recentMatching = matching;

    //   try {
    //     final response = await supabase
    //         .from('matchings')
    //         .select('*, target_user: users (id, first_name, email)')
    //         .eq(
    //           'created_by',
    //           matching.targetUserId,
    //         )
    //         .eq('target_user_id', _authService.user!.id!)
    //         .is_('liked', true)
    //         .single()
    //         .execute();

    //     log.v('SupabaseEventTypes.insert | response "${response.toJson()}"');

    //     if (response.error != null) {
    //       return log.e(response.error?.message);
    //     }

    //     _targetMatching = Matching.fromJson(response.data);

    //     log.v('_targetMatching "${_targetMatching?.toJson()}"');

    //     notifyListeners();
    //   } catch (e) {
    //     log.e('error "$e"');
    //   }
    // }).subscribe();
    // log.v(
    //   'matchingsTargetUserIds "$matchingsTargetUserIds", userIds "$userIds"',
    // );
    // log.i(
    //   'users.length "${users.length}"',
    // );
    setBusy(false);
  }

  Future<void> fetchUsers() async {
    final response = await runBusyFuture<sb.PostgrestResponse>(
      supabase
          .from(_userService.table)
          .select(
            '*, interests: user_interests (user_id, interest_id, interest: interests (name) )',
          )
          .not('id', 'in', '(${matchingsTargetUserIds.join(',')})')
          .neq('id', _authService.user!.id!)
          .is_('deleted_at', null)
          .execute(),
      busyObject: _fetchUsersKey,
      throwException: true,
    );
    log.v('response "${response.toJson()}"');

    if (response.error != null) {
      log.e(response.error?.message);
      return;
    }

    _users = (response.data as List).map((e) => User.fromJson(e)).toList();

    _swipeItems = users.map((user) {
      return SwipeItem(
        content: user.id,
        likeAction: () {
          log.v('like "${user.id}"');
          likeUser();
        },
        nopeAction: () {
          log.v('nope "${user.id}"');
          nopeUser();
        },
      );
    }).toList();
    _matchEngine = MatchEngine(swipeItems: swipeItems);

    notifyListeners();
  }

  Future<void> fetchMyMatchings() async {
    final response = await runBusyFuture<sb.PostgrestResponse>(
      _matchingService.fetchMyMatchingSubmissions(),
      busyObject: _fetchMyMatchingsKey,
      throwException: true,
    );
    log.v('response "${response.toJson()}"');

    if (response.error != null) {
      log.e(response.error?.message);
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
      log.e(response.error?.message);
      return _snackbarService.showError();
    }

    _recentMatching = Matching.fromJson(response.data.first);

    await checkIfLikeBack();

    // _matchEngine.currentItem?.like();
    notifyListeners();
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
      log.e(response.error?.message);
      return _snackbarService.showError();
    }

    // _matchEngine.currentItem?.nope();
    notifyListeners();
  }

  Future<void> checkIfLikeBack() async {
    final response = await supabase
        .from('matchings')
        .select()
        .eq('created_by', _recentMatching?.targetUserId)
        .eq('target_user_id', _authService.user?.id)
        .is_('liked', true)
        .single()
        .execute();
    log.i('checkIfLikeBack response "${response.toJson()}"');

    if (response.error != null) {
      return log.e(response.error?.message);
    }

    final matching = Matching.fromJson(response.data);

    _appViewModel.addMatching(matching);
  }

  void viewUserProfile() {
    _router.navigateTo(
      Routes.userDetailView(
        userId: _matchEngine.currentItem!.content,
      ),
    );
  }

  void toConversationView() {
    _router.navigateWithTransition(
      ConversationDetailView(conversationId: '1231233'),
      transition: 'none',
    );
  }

  void toUserDetailView(User user) {
    _router.navigateTo(
      Routes.userDetailView(userId: user.id!),
    );
  }
}
