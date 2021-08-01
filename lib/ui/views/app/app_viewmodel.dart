import 'package:comradery/app.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/matching/models/matching.dart';
import 'package:comradery/matching/services/matching_service.dart';
import 'package:logger/logger.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase/supabase.dart';

class AppViewModel extends BaseViewModel {
  final log = Logger();
  final _authService = locator<AuthService>();
  final _matchingService = locator<MatchingService>();
  final _router = locator<NavigationService>();

  String? get userFullName => _authService.user?.fullName;
  String get userEmail => _authService.user?.email ?? '-';

  List<Matching> _matchings = [];
  List<Matching> get matchings => _matchings;
  String get _fetchMatchedIndividualsKey => '_fetchMatchedIndividualsKey';
  bool get fetchMatchedIndividualsBusy => busy(_fetchMatchedIndividualsKey);

  Future<void> init() async {
    await Future.wait([
      fetchMatchedIndividuals(),
    ]);

    // INSERT
    supabase
        .from(
      '${_matchingService.table}:created_by=eq.${_authService.user?.id}',
    )
        .on(SupabaseEventTypes.insert, (payload) {
      log.v('payload?.newRecord "${payload.newRecord}"');
      final matching = Matching.fromJson(payload.newRecord);

      // TODO: Like back logic need to implement
      if (matching.targetUserId == _authService.user!.id! && matching.liked) {
        _matchings.add(matching);
      }

      notifyListeners();
    }).subscribe();

    // DELETE
    supabase.from(_matchingService.table).on(SupabaseEventTypes.delete,
        (payload) {
      log.v(
        'payload?.newRecord "${payload.newRecord}", payload?.oldRecord "${payload.oldRecord}"',
      );

      _matchings
          .removeWhere((element) => element.id == payload.oldRecord['id']);
      notifyListeners();
    }).subscribe();
  }

  Future<void> fetchMatchedIndividuals() async {
    final response = await runBusyFuture<PostgrestResponse>(
      supabase
          .from(_matchingService.table)
          .select('*, created_by_user: users (*)')
          .eq('target_user_id', _authService.user!.id!)
          .neq('created_by', _authService.user!.id!)
          .is_('liked', true)
          .is_('deleted_at', null)
          .execute(),
      busyObject: _fetchMatchedIndividualsKey,
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

  void toUserDetailView(String value) {
    _router.navigateTo(
      AppViewRoutes.userDetailView(userId: value),
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
