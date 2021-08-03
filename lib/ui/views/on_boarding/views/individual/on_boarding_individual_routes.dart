import 'package:stacked/stacked_annotations.dart';

import 'views/select_goal/select_goal_view.dart';
import 'views/select_interests/select_interests_view.dart';
import 'views/setup_user_profile/setup_user_profile_view.dart';
import 'views/upload_photo/upload_photo_view.dart';

const routes = [
  MaterialRoute(
    page: SelectGoalView,
    path: '/on-boarding/select-goal',
  ),
  MaterialRoute(
    page: UploadPhotoView,
    path: '/on-boarding/upload-photo',
  ),
  MaterialRoute(
    page: SelectInterestsView,
    path: '/on-boarding/select-interests',
  ),
  MaterialRoute(
    page: SetupUserProfileView,
    path: '/on-boarding/setup-profile',
  ),
];
