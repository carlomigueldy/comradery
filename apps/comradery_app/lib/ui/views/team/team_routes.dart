import 'package:stacked/stacked_annotations.dart';

import 'views/team_detail/team_detail_view.dart';
import 'views/welcome_to_team/welcome_to_team_view.dart';

const routes = [
  CupertinoRoute(
    page: TeamDetailView,
    path: '/teams/:teamId',
  ),
  CupertinoRoute(
    page: WelcomeToTeamView,
    path: '/teams/:teamId/welcome',
  ),
];
