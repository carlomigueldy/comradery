import 'package:stacked/stacked_annotations.dart';

import 'views/setup_team_profile/setup_team_profile_view.dart';
import 'views/upload_team_photo/upload_team_photo_view.dart';

const routes = [
  CupertinoRoute(
    page: SetupTeamProfileView,
    path: 'on-boarding/setup-team-profile',
  ),
  CupertinoRoute(
    page: UploadTeamPhotoView,
    path: 'on-boarding/upload-team-photo',
  ),
];
