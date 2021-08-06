import 'package:comradery/app.dart';
import 'package:comradery/app.logger.dart';
import 'package:comradery/auth/services/auth_service.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/team/models/team.dart';
import 'package:comradery/team/models/team_member.dart';
import 'package:comradery/team/services/team_service.dart';
import 'package:comradery/ui/views/on_boarding/common/on_boarding_viewmodel.dart';
import 'package:comradery/ui/views/on_boarding/views/create_team/common/create_team_viewmodel.dart';
import 'package:stacked_services/stacked_services.dart';

class SetupTeamProfileViewModel extends OnBoardingViewModel {
  final log = stackedLogger('SetupTeamProfileViewModel');
  final _teamService = locator<TeamService>();
  final _createTeamViewModel = locator<CreateTeamViewModel>();
  final _authService = locator<AuthService>();
  final _router = locator<NavigationService>();

  SetupTeamProfileViewModel({
    required this.onBoarding,
  });

  final bool onBoarding;

  Future<void> createTeam(Map<String, dynamic> value) async {
    log.v('value "$value"');

    setBusy(true);

    try {
      final response = await _teamService.create(
        Team(
          name: value['name'],
          description: value['description'],
          createdBy: _authService.user!.id!,
        ).toPayload(),
      );

      if (response.error != null) {
        return log.e(response.error?.message);
      }

      final team = Team.fromJson(response.data.first);
      _createTeamViewModel.team = team;

      // create team members
      final createTeamMemberResponse = await supabase
          .from('team_members')
          .insert(
            TeamMember(
              userId: _authService.user!.id!,
              teamId: team.id!,
            ).toPayload(),
          )
          .execute();
      log.v('createTeamMemberResponse "${createTeamMemberResponse.toJson()}"');

      if (createTeamMemberResponse.error != null) {
        log.e(createTeamMemberResponse.error?.message);
      }

      _router.navigateTo(
        Routes.uploadTeamPhotoView,
        arguments: UploadTeamPhotoViewArguments(
          onBoarding: onBoarding,
        ),
      );
    } catch (e) {
      log.e('error "$e"');
    } finally {
      setBusy(false);
    }
  }
}
