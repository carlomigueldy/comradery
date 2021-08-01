import 'package:stacked/stacked_annotations.dart';

import 'views/user_detail/user_detail_view.dart';

const routes = [
  CustomRoute(
    page: UserDetailView,
    path: 'users/:userId',
  )
];
