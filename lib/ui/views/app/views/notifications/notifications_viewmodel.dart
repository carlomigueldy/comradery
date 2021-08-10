import 'package:comradery/app.dart';
import 'package:comradery/app.logger.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/services/app_snackbar_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/team/models/team_member.dart';
import 'package:comradery/team/models/team_request.dart';
import 'package:comradery/team/services/team_request_service.dart';
import 'package:comradery/ui/views/app/app_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase/supabase.dart';

class NotificationsViewModel extends BaseViewModel {
  final log = stackedLogger('NotificationsViewModel');
  final _teamRequestService = locator<TeamRequestService>();
  final _authService = locator<AuthService>();
  final _snackbarService = locator<AppSnackbarService>();
  final _appViewModel = locator<AppViewModel>();

  List<TeamRequest> _teamRequests = [];
  List<TeamRequest> get teamRequests => _teamRequests;
  String get _fetchTeamRequestsKey => '_fetchTeamRequestsKey';
  bool get fetchTeamRequestsBusy => busy(_fetchTeamRequestsKey);

  String get _acceptInviteKey => '_acceptInviteKey';
  bool get acceptInviteBusy => busy(_acceptInviteKey);

  void init() {
    fetchTeamRequests();
  }

  Future<void> fetchTeamRequests() async {
    final response = await runBusyFuture<PostgrestResponse>(
      supabase
          .from('team_requests')
          .select('*, team: teams (id, name, created_by)')
          .not(
            'team_id',
            'in',
            '(${_appViewModel.myTeams.map((e) => e.id).toList().join(',')})',
          )
          // .eq(
          //   'created_by',
          //   _authService.user!.id!,
          // )
          .execute(),
      busyObject: _fetchTeamRequestsKey,
      throwException: true,
    );

    if (response.error != null) {
      return log.e(response.error?.message);
    }

    _teamRequests =
        (response.data as List).map((e) => TeamRequest.fromJson(e)).toList();
    notifyListeners();
  }

  void acceptInvite(String teamId) async {
    final response = await runBusyFuture<PostgrestResponse>(
      supabase.from('team_members').insert({
        'user_id': _authService.user!.id!,
        'team_id': teamId,
      }).execute(),
      busyObject: _acceptInviteKey,
      throwException: true,
    );

    if (response.error != null) {
      return log.e(response.error?.message);
    }

    final teamMember = TeamMember.fromJson(response.data.first);

    supabase
        .from('team_members')
        .update({'deleted_at': true})
        .eq(
          'user_id',
          teamMember.userId,
        )
        .eq(
          'team_id',
          teamMember.teamId,
        )
        .is_('deleted_at', null)
        .execute();

    _snackbarService.show('You have accepted the team invite');
    await _appViewModel.fetchMyTeams();
    fetchTeamRequests();
  }
}
