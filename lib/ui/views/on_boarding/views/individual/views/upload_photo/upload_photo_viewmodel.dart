import 'dart:typed_data';

import 'package:comradery/app.dart';
import 'package:comradery/common/supabase/supabase_client.dart';
import 'package:comradery/ui/views/on_boarding/common/on_boarding_viewmodel.dart';

class UploadPhotoViewModel extends OnBoardingViewModel {
  Future<void> uploadPhoto() async {
    final response = await runBusyFuture(
      supabase.storage.from('main').upload(
            'avatars/${authService.user!.id}',
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

    final updateUserResponse = await supabase
        .from('users')
        .update({'photo_url': response.data})
        .eq('id', authService.user!.id!)
        .execute();
    log.v('updateUserResponse "${updateUserResponse.toJson()}"');
  }

  void proceed() async {
    if (hasFile) {
      await uploadPhoto();
    }

    router.navigateTo(Routes.setupUserProfileView);
  }
}
