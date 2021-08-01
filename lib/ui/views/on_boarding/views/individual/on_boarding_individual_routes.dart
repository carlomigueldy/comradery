import 'package:stacked/stacked_annotations.dart';

import 'views/select_goal/select_goal_view.dart';
import 'views/select_interests/select_interests_view.dart';
import 'views/setup_user_profile/setup_user_profile_view.dart';
import 'views/upload_photo/upload_photo_view.dart';

const routes = [
  CustomRoute(
    page: SelectGoalView,
    path: 'on-boarding/select-goal',
  ),
  CustomRoute(
    page: UploadPhotoView,
    path: 'on-boarding/upload-photo',
  ),
  CustomRoute(
    page: SelectInterestsView,
    path: 'on-boarding/select-interests',
  ),
  CustomRoute(
    page: SetupUserProfileView,
    path: 'on-boarding/setup-profile',
  ),
];
