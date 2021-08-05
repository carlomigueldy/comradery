import 'package:comradery/app.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/ui/views/on_boarding/common/on_boarding_viewmodel.dart';
import 'package:comradery/ui/views/on_boarding/views/create_team/common/create_team_viewmodel.dart';

class UploadTeamPhotoViewModel extends OnBoardingViewModel {
  final _createTeamViewModel = locator<CreateTeamViewModel>();

  Future<void> uploadPhoto() async {
    if (_createTeamViewModel.team == null) {
      return;
    }

    final response = await runBusyFuture(
      supabase.storage.from('main').upload(
            'teams/${_createTeamViewModel.team!.id}',
            file!,
          ),
      busyObject: uploadPhotoKey,
      throwException: true,
    );
    log.v('response "$response"');
    log.v('response.data "${response.data}"');

    if (response.error != null) {
      return log.e(response.error?.message);
    }

    final updateTeamResponse = await supabase
        .from('teams')
        .update({'photo_url': response.data})
        .eq('id', _createTeamViewModel.team!.id)
        .execute();
    log.v('updateTeamResponse "${updateTeamResponse.toJson()}"');
  }

  void proceed() async {
    if (hasFile) {
      await uploadPhoto();
    }

    router.navigateTo(Routes.setupUserProfileView);
  }
}
