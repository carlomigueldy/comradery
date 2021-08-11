import 'package:comradery/app.dart';
import 'package:comradery/app.logger.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/conversation/models/conversation.dart';
import 'package:comradery/matching/models/matching.dart';
import 'package:comradery/matching/services/matching_service.dart';
import 'package:comradery/team/models/team.dart';
import 'package:comradery/user/models/user.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase/supabase.dart' as sp;

class AppViewModel extends BaseViewModel {
  final log = stackedLogger('AppViewModel');
  final _authService = locator<AuthService>();
  final _matchingService = locator<MatchingService>();
  final _router = locator<NavigationService>();

  String? get userFullName => _authService.user?.fullName;
  String get userEmail => _authService.user?.email ?? '-';
  User? get authUser => _authService.user;

  List<Conversation> _conversations = [];
  List<Conversation> get conversations => _conversations;
  String get _fetchMyConversationsKey => '_fetchMyConversationsKey';
  bool get fetchMyConversationsBusy => busy(_fetchMyConversationsKey);

  List<Team> _myTeams = [];
  List<Team> get myTeams => _myTeams;
  String get _fetchMyTeamsKey => '_fetchMyTeamsKey';
  bool get fetchMyTeamsBusy => busy(_fetchMyTeamsKey);

  Matching? _recentMatching;
  Matching? get recentMatching => _recentMatching;

  Matching? _targetMatching;
  Matching? get targetMatching => _targetMatching;

  Future<void> init() async {
    await Future.wait([
      // fetchWhoLikedMe(),
      // fetchMyMatchings(),
      fetchMyConversations(),
      fetchMyTeams(),
    ]);
  }

  Future<void> fetchMyTeams() async {
    final response = await runBusyFuture<sp.PostgrestResponse>(
      supabase
          .from('teams')
          .select('*, team_members (user_id, team_id)')
          .eq('created_by', _authService.user!.id!)
          .is_('team_members.deleted_at', null)
          .in_(
            'team_members.user_id',
            [_authService.user!.id!],
          )
          .is_('deleted_at', null)
          .execute(),
      busyObject: _fetchMyTeamsKey,
      throwException: true,
    );
    log.v('fetchMyTeams-response "${response.toJson()}"');

    if (response.error != null) {
      log.e(response.error?.message);
      return;
    }

    _myTeams = (response.data as List).map((e) => Team.fromJson(e)).toList();
    notifyListeners();
  }

  Future<void> fetchMyConversations() async {
    final cpResponse = await supabase
        .from('conversation_participants')
        .select('conversation_id')
        .eq('user_id', _authService.user!.id!)
        .is_('deleted_at', null)
        .execute();
    // log.v('cpResponse "${cpResponse.toJson()}"');
    if (cpResponse.error != null) {
      return log.e('cpResponse.error?.message "${cpResponse.error?.message}"');
    }
    final conversationIds = (cpResponse.data as List<dynamic>)
        .map((e) => e['conversation_id'])
        .toList();
    // log.v('cpResponse.conversationIds "$conversationIds"');

    if (conversationIds.isEmpty) {
      return;
    }

    final response = await runBusyFuture<sp.PostgrestResponse>(
      supabase
          .from('conversations')
          .select(
            '*, '
            'conversation_participants: conversation_participants ('
            '*, user: users (id, first_name, last_name, email, photo_url)'
            ')',
          )
          .in_('id', conversationIds)
          // .in_('conversation_participants.user_id', [_authService.user!.id!])
          .is_('deleted_at', null)
          .execute(),
      busyObject: _fetchMyConversationsKey,
      throwException: true,
    );
    // log.v('fetchMyConversations-response "${response.toJson()}"');
    // log.i(response.toJson());

    if (response.error != null) {
      log.e(response.error?.message);
      return;
    }

    _conversations =
        (response.data as List).map((e) => Conversation.fromJson(e)).toList();
    notifyListeners();
  }

  Conversation? findConversationFromUser(User targetUser) {
    Conversation? conversation;

    _conversations
        .where((element) => element.type == ConversationType.private)
        .forEach((element) {
      if (element.participantIds.contains(targetUser.id)) {
        conversation = element;
      }

      return;
    });

    log.v('${targetUser.fullName} conversation "${conversation?.toJson()}"');

    return conversation;
  }

  void logout() {
    _authService.signOut();
    _router.replaceWith(Routes.signInView);

    dispose();
  }

  void toConversationDetailView(String value) {
    _router.navigateTo(
      Routes.conversationDetailView(conversationId: value),
    );
  }

  void toUserDetailView(String value) {
    _router.navigateTo(
      Routes.userDetailView(userId: value),
    );
  }

  void toTeamDetailView(String value) {
    _router.navigateTo(
      Routes.teamDetailView(teamId: value),
    );
  }

  // void addMatching(Matching matching) {
  //   log.v('New matching "${matching.toJson()}"');
  //   // _matchings.add(matching);
  //   fetchMyMatchings();
  // }

  void createTeam() {
    _router.navigateTo(
      Routes.setupTeamProfileView,
      arguments: SetupTeamProfileViewArguments(
        onBoarding: false,
      ),
    );
  }
}
